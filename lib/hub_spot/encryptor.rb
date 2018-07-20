# frozen_string_literal: true

module HubSpot
  class Encryptor
    class << self
      def decrypt(token)
        encryption_box.decrypt(token.b)
      end

      def encrypt(token)
        encryption_box.encrypt(token)
      end

      private

      def encryption_box
        RbNaCl::SimpleBox.from_secret_key(HubSpot.configuration.secret_encryption_key.b)
      end
    end
  end
end
