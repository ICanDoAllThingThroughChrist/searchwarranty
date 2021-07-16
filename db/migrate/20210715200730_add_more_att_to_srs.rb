class AddMoreAttToSrs < ActiveRecord::Migration[5.2]
  def change
    add_column :srs, :DoNotModifyCase, :string
    add_column :srs, :DoNotModifyRowChecksum, :string
    add_column :srs, :AlternateCaseNumber, :string
    add_column :srs, :status_reason, :string
    add_column :srs, :CreatedBy, :string
    add_column :srs, :SLAStartTime, :datetime
    add_column :srs, :SLAStartTimeUserLocal, :datetime
    add_column :srs, :ResolutionDate, :datetime
    add_column :srs, :CloseDate, :datetime
  end
end
