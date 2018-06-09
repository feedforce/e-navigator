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
    def permit_params
      column_names
    end

    def unavailable() 0; end
    def available()   1; end

    def alive()     0; end
    def deleted()   1; end

    def alive_records
      where(deleted: alive)
    end
  end
end
