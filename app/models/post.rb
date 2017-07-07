class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction","Non-Fiction"]}
  before_validation :clickbait

  def clickbait

   return false if self.title.nil?

   arr = ["Won't Believe","Secret","Top [number]", "Guess"]
   title_status = arr.select do |phrase|
     self.title.include?(phrase)
   end.empty?
   !title_status
  end

end
