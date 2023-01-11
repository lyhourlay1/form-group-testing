# The name of this view in Looker is "Pi Signature"
view: pi_signature {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.pi_signature ;;
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
  # This dimension will be called "Deleted" in Explore.

  dimension: deleted {
    type: yesno
    sql: ${TABLE}."deleted" ;;
  }

  dimension: form_name {
    type: string
    sql: ${TABLE}."form_name" ;;
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

  dimension: url {
    type: string
    sql: ${TABLE}."url" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."user_id" ;;
  }

  dimension: web_hook_answer_set_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."web_hook_answer_set_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, form_name, web_hook_answer_set.id, source_data.count]
  }
}
