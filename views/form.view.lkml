# The name of this view in Looker is "Form"
view: form {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.form ;;
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
  # This dimension will be called "Form Group ID" in Explore.

  dimension: form_group_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."form_group_id" ;;
  }

  dimension: formsort_flow_label {
    type: string
    sql: ${TABLE}."formsort_flow_label" ;;
  }

  dimension: is_adhoc {
    type: yesno
    sql: ${TABLE}."is_adhoc" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: subject_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."subject_id" ;;
  }

  dimension: trial_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."trial_id" ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      subject.id,
      trial.id,
      trial.name,
      form_group.name,
      form_group.id,
      source_data.count
    ]
  }
}
