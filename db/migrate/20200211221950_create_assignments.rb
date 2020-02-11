class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :site1recycling
      t.string :westparkWkshtCollected
      t.string :site2Collection
      t.string :neWkshtCollected
      t.string :site3Collection
      t.string :seWkshtCollected
      t.string :site4Collection
      t.string :nwWkshtCollected
      t.string :site5Collection
      t.string :swWkshtCollected
      t.datetime :nextDeadline
      t.string :tasks
      t.string :status
      t.integer :Wksht
      t.string :FundedOrUnfundedCDBGEligible
      t.string :member1
      t.string :member2
      t.string :member3
      t.string :Submit
      t.string :perform
      t.integer :lead1
      t.integer :lead2
      t.integer :lead3
      t.string :monitoring1
      t.string :auditorLink
      t.string :taskResourceLink
      t.string :site6SommermeyerNhd
      t.string :site6SommerWkshtCollected
      t.string :site7CentralNhd
      t.string :site7CentralWkshtCollected
      t.string :Site8KirkpatrickNhd
      t.string :site8KirkpatrickWkshtCollected
      t.string :Site9SunbeamNhd
      t.string :Site9SunbeamNhdWkshtCollected
      t.string :Site10SwFwyNhd
      t.string :site10SwFwyNhdWkshtCollected
      t.string :Site11NMainNhd
      t.string :site11NMainWkshtCollected
      t.string :site12HolmesRoadLandfill
      t.string :site12HolmesRoadLandfillRelatedDocs
      t.integer :site1WestparkOverdue
      t.integer :site2NeOverdue
      t.integer :site3SeOverdue
      t.integer :site4NwOverdue
      t.integer :site5SwOverdue
      t.integer :site6SommmermeyerOverdue
      t.integer :site7CentralOverdue
      t.integer :site8KirkpatrickOverdue
      t.integer :site9SunbeamOverdue
      t.integer :site10SwFwyOverdue
      t.integer :site11NMainOverdue
      t.integer :site12HolmesOverdue

      t.timestamps
    end
  end
end
