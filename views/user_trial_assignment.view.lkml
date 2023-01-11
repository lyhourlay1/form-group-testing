# The name of this view in Looker is "User Trial Assignment"
view: user_trial_assignment {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.user_trial_assignment ;;
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
  # This dimension will be called "Role" in Explore.

  dimension: role {
    type: string
    sql: ${TABLE}."role" ;;
  }

  dimension: trial_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."trial_id" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."user_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, trial.id, trial.name]
  }
}
