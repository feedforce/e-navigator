class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def soft_delete
    self.available  = self.class._unavailable_ if respond_to?(:available)
    self.deleted    = self.class._deleted_ if respond_to?(:deleted)
    self.deleted_at =  Time.now if respond_to?(:deleted_at)
    save(validate: false)
  end

  def all_destroy
    soft_delete
  end

  class << self
    def permit_params
      column_names+ [
          :_destroy
      ]
    end

    def _unavailable_() 0; end
    def _available_()   1; end

    def _alive_()     0; end
    def _deleted_()   1; end

    def alive_records
      where(deleted: _alive_)
    end
  end
end
