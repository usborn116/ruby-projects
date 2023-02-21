require './lib/caeser-cipher'

describe Caesar do
    describe "#caeser_cipher" do
      it "returns " do
        caeser = Caesar.new
        expect(caeser.caeser_cipher("This is a great program!", 7)).not_to be_kind_of(Numeric)
      end

      it "returns a string" do
        caeser = Caesar.new
        expect(caeser.caeser_cipher("This is a great program!", 7)).to be_kind_of(String)
      end

      it "not return the same string" do
        caeser = Caesar.new
        expect(caeser.caeser_cipher("This is a great program!", 7)).not_to eql("This is a great program!")
      end

      it "returns same amount of characters" do
        caeser = Caesar.new
        expect(caeser.caeser_cipher("This is a great program!", 7)).to have_attributes( size: "This is a great program!".length)
      end
    end
end