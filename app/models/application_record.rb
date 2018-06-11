class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def soft_delete
    self.available  = self.class.unavailable if respond_to?(:available)
    self.deleted    = self.class.deleted if respond_to?(:deleted)
    self.deleted_at = Time.now if respond_to?(:deleted_at)
    save(validate: false)
  end

  def all_destroy
    soft_delete
  end

  class << self
    ALIVE = 0
    DELETED = 1

    def permit_params
      column_names
    end

    def alive_records
      where(deleted: ALIVE)
    end
  end
end
