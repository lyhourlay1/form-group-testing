# The name of this view in Looker is "Pending Data Changes"
view: pending_data_changes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.pending_data_changes ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
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
    sql: ${TABLE}."created_at" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Creator ID" in Explore.

  dimension: creator_id {
    type: string
    sql: ${TABLE}."creator_id" ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}."deleted" ;;
  }

  dimension: subject_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."subject_id" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: web_hook_answer_set_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."web_hook_answer_set_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, web_hook_answer_set.id, subject.id, pending_data_change.count]
  }
}
