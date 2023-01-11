# The name of this view in Looker is "Pending Data Change"
view: pending_data_change {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.pending_data_change ;;
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
  # This dimension will be called "Answer" in Explore.

  dimension: answer {
    type: string
    sql: ${TABLE}."answer" ;;
  }

  dimension: answer_type {
    type: string
    sql: ${TABLE}."answer_type" ;;
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

  dimension: deleted {
    type: yesno
    sql: ${TABLE}."deleted" ;;
  }

  dimension: formsort_question_key {
    type: string
    sql: ${TABLE}."formsort_question_key" ;;
  }

  dimension: group_label {
    type: string
    sql: ${TABLE}."group_label" ;;
  }

  dimension: is_data_point_deleted {
    type: yesno
    sql: ${TABLE}."isDataPointDeleted" ;;
  }

  dimension: pending_data_changes_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."pending_data_changes_id" ;;
  }

  dimension: question {
    type: string
    sql: ${TABLE}."question" ;;
  }

  dimension: source_data_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."source_data_id" ;;
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

  measure: count {
    type: count
    drill_fields: [id, source_data.id, pending_data_changes.id]
  }
}
