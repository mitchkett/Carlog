require 'money'

module ActiveRecord #:nodoc:
  module Acts #:nodoc:
    module Money #:nodoc:
      def self.included(base) #:nodoc:
        base.extend ClassMethods
      end

      module ClassMethods
        def money(name, options = {})
          allow_nil = options.has_key?(:allow_nil) ? options.delete(:allow_nil) : true
          options = {:precision => 2, :cents => "#{name}_in_cents".to_sym }.merge(options)
          mapping = [[options[:cents], 'cents']]
          mapping << [options[:currency].to_s, 'currency'] if options[:currency]
          composed_of name, :class_name => 'Money', :mapping => mapping, :allow_nil => allow_nil,
            :converter => lambda{ |m|
              if !allow_nil && m.nil?
                currency = options[:currency] || ::Money.default_currency
                m = ::Money.new(0, currency, options[:precision])
              end
              m.to_money(options[:precision])
            },
            :constructor => lambda{ |*args| 
              cents, currency = args
              cents ||= 0
              currency ||= ::Money.default_currency
              ::Money.new(cents, currency, options[:precision]) 
            }

          define_method "#{name}_with_cleanup=" do |amount|
            send "#{name}_without_cleanup=", amount.blank? ? nil : amount.to_money(options[:precision])
          end
          alias_method_chain "#{name}=", :cleanup
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, ActiveRecord::Acts::Money
