class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :site1recycling
      t.string :westparkwkshtcollected
      t.string :site2collection
      t.string :newkshtcollected
      t.string :site3collection
      t.string :sewkshtcollected
      t.string :site4collection
      t.string :nwwkshtcollected
      t.string :site5collection
      t.string :swwkshtcollected
      t.datetime :nextdeadline
      t.string :tasks
      t.string :status
      t.integer :wksht
      t.string :fundedorunfundedcdbgeligible
      t.string :member1
      t.string :member2
      t.string :member3
      t.string :submit
      t.string :perform
      t.integer :lead1
      t.integer :lead2
      t.integer :lead3
      t.string :monitoring1
      t.string :auditorlink
      t.string :taskresourcelink
      t.string :site6sommermeyernhd
      t.string :site6sommerwkshtcollected
      t.string :site7centralnhd
      t.string :site7centralwkshtcollected
      t.string :site8kirkpatricknhd
      t.string :site8kirkpatrickwkshtcollected
      t.string :site9sunbeamnhd
      t.string :site9sunbeamnhdwkshtcollected
      t.string :site10swfwynhd
      t.string :site10swfwynhdwkshtcollected
      t.string :site11nmainnhd
      t.string :site11nmainwkshtcollected
      t.string :site12holmesroadlandfill
      t.string :site12holmesroadlandfillrelateddocs
      t.integer :site1westparkoverdue
      t.integer :site2neoverdue
      t.integer :site3seoverdue
      t.integer :site4nwoverdue
      t.integer :site5swoverdue
      t.integer :site6sommmermeyeroverdue
      t.integer :site7centraloverdue
      t.integer :site8kirkpatrickoverdue
      t.integer :site9sunbeamoverdue
      t.integer :site10swfwyoverdue
      t.integer :site11nmainoverdue
      t.integer :site12holmesoverdue

      t.timestamps
    end
  end
end
