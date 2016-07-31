class AddColumnHibikiProgramV2EpisodeType < ActiveRecord::Migration
  def up
    sql = <<EOF
ALTER TABLE `hibiki_program_v2s`
ADD COLUMN `episode_type` int UNSIGNED NOT NULL
AFTER `episode_id`
EOF
    ActiveRecord::Base.connection.execute(sql)

    sql = <<EOF
ALTER TABLE `hibiki_program_v2s`
DROP INDEX access_id,
ADD UNIQUE KEY `access_id` (`access_id`,`episode_id`,`episode_type`)
EOF
    ActiveRecord::Base.connection.execute(sql)
  end

  def down
  end
end
