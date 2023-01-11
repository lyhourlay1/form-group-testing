# The name of this view in Looker is " Prisma Migrations"
view: _prisma_migrations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public._prisma_migrations ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Applied Steps Count" in Explore.

  dimension: applied_steps_count {
    type: number
    sql: ${TABLE}."applied_steps_count" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_applied_steps_count {
    type: sum
    sql: ${applied_steps_count} ;;
  }

  measure: average_applied_steps_count {
    type: average
    sql: ${applied_steps_count} ;;
  }

  dimension: checksum {
    type: string
    sql: ${TABLE}."checksum" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: finished {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."finished_at" ;;
  }

  dimension: logs {
    type: string
    sql: ${TABLE}."logs" ;;
  }

  dimension: migration_name {
    type: string
    sql: ${TABLE}."migration_name" ;;
  }

  dimension_group: rolled_back {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."rolled_back_at" ;;
  }

  dimension_group: started {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."started_at" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, migration_name]
  }
}
