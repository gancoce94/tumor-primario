class CreateTumors < ActiveRecord::Migration
  def change
    create_table :tumors do |t|
      t.string :edad
      t.string :genero
      t.string :tipo_histologico
      t.string :grado_tumor
      t.boolean :hueso
      t.boolean :medula_osea
      t.boolean :pulmon
      t.boolean :pleura
      t.boolean :peritoneum
      t.boolean :higado
      t.boolean :cerebro
      t.boolean :piel
      t.boolean :cuello
      t.boolean :supraclavicular
      t.boolean :axilar
      t.boolean :mediastino
      t.boolean :abdominal
      t.string :tipo_tumor

      t.timestamps
    end
  end
end
