module Line5
  module Users
    module DeviseOverrides
      RECENTLY_SENT_TIME_PERIOD = 1.day.ago

      def self.included(base)
        base.extend(ClassMethods)
      end

      def serializable_hash(options = nil)
        # you can keep adding attributes here that you wish to expose
        super(options).merge(locked_at: locked_at, failed_attempts: failed_attempts,
          current_sign_in_at: current_sign_in_at, last_sign_in_at: last_sign_in_at,
          current_sign_in_ip: current_sign_in_ip)
      end

      def send_reset_password_instructions(host)
        token = generate_reset_token
        send_devise_notification(:reset_password_instructions, token, { host: host })

        token
      end

      def send_devise_notification(notification, *args)
        devise_mailer.send(notification, self, *args).deliver
      end

      # this method is called by devise to check for "active" state of the model
      def active_for_authentication?
        super && active
      end

      def generate_reset_token
        token = sent_recently? ? raw_reset_token : set_reset_password_token
        update(raw_reset_token: token)
        token
      end

      def set_reset_password_token
        super
      end

      def sent_recently?
        return false unless reset_password_sent_at && reset_password_token && raw_reset_token
        reset_password_sent_at > RECENTLY_SENT_TIME_PERIOD
      end

      module ClassMethods
        def send_reset_password_instructions(attributes={})
          host = attributes.delete(:host)
          recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
          recoverable.send_reset_password_instructions(host) if recoverable.persisted?
          recoverable
        end
      end
    end
  end
end
