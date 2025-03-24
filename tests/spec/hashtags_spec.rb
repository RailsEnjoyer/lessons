require 'rspec'

class HashtagParser
  def self.extract(text)
    text.scan(/#[[:word:]-]+/)
  end
end

RSpec.describe HashtagParser do
  describe '.extract' do
    it 'захватывается 1 хэштег' do
      input = "Вот мой новый #блог!"
      expect(described_class.extract(input)).to eq(["#блог"])
    end

    it 'захватывается несколько хэштегов' do
      input = "Я люблю #ruby и #rspec!"
      expect(described_class.extract(input)).to eq(["#ruby", "#rspec"])
    end

    it 'захватывается хэштег на русском' do
      input = "Привет с #Колымы!"
      expect(described_class.extract(input)).to eq(["#Колымы"])
    end

    it 'захватывается хэштег с подчеркиваниями' do
      input = "Вот пример #hash_tag_test"
      expect(described_class.extract(input)).to eq(["#hash_tag_test"])
    end

    it 'захватывается хэштег с минусами' do
      input = "А здесь #hash-tag-test"
      expect(described_class.extract(input)).to eq(["#hash-tag-test"])
    end

    it 'не захватывается знак вопроса' do
      input = "А что насчет #hash?"
      expect(described_class.extract(input)).to eq(["#hash"])
    end

    it 'не захватывается восклицательный знак' do
      input = "Вот #hash!"
      expect(described_class.extract(input)).to eq(["#hash"])
    end
  end
end