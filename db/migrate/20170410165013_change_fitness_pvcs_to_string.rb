class ChangeFitnessPvcsToString < ActiveRecord::Migration
  def change
        remove_column :fitness_test_tests, :fitness_pvcs
    add_column :fitness_test_tests, :fitness_pvcs, :string
  end
end
