module HashaId
  extend ActiveSupport::Concern

  def hash_id
    Hashids.new(hash_ids_salt, 16).encode self.id
  end

  def find_by_hash_id(hash_id)
    outcome = Hashids.new(hash_ids_salt, 16).decode hash_id

    self.find_by_id outcome.first.to_i
  end

  private

  def hash_ids_salt
    ENV['SECRET_TOKEN'] || [*'0'..'9', *'A'..'Z', *'a'..'z'].join
  end
end