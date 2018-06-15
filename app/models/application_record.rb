class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def soft_delete
    self.deleted    = 1 if respond_to?(:deleted)
    self.deleted_at = Time.now if respond_to?(:deleted_at)
    save(validate: false)
  end

  def all_destroy
    soft_delete
  end

  class << self
    def alive_records
      where(deleted: 0)
    end
  end
end
