module Staged
  module PetitionCreator
    class Sponsors < Staged::Base::Petition
      include Staged::Validations::SponsorDetails

      delegate :sponsors, to: :petition

      def validation_context
        :create
      end

      validate :sponsors_valid?

      private

      def sponsors_valid?
        # Make sure we ask all sponsors to validate before returning
        sponsors.map(&:valid?).all?
      end
    end
  end
end