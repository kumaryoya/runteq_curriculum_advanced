class SearchArticlesForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :category_id, :integer
  attribute :author_id, :integer
  attribute :tag_id, :integer
  attribute :body, :string
  attribute :title, :string

  def search
    relation = Article.distinct

    relation = relation.by_category(category_id) if category_id.present?
    relation = relation.by_author(author_id) if author_id.present?
    relation = relation.by_tag(tag_id) if tag_id.present?
    body_words.each do |word|
      relation = relation.body_contain(word)
    end
    title_words.each do |word|
      relation = relation.title_contain(word)
    end
    relation
  end

  private

  def body_words
    body.present? ? body.split(nil) : []
  end

  def title_words
    title.present? ? title.split(nil) : []
  end
end
