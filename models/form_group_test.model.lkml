# Define the database connection to be used for this model.
connection: "dcs_dev"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: form_group_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: form_group_test_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Form Group Test"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: _prisma_migrations {}

explore: clinic {}

explore: clinic_trial {
  join: clinic {
    type: left_outer
    sql_on: ${clinic_trial.clinic_id} = ${clinic.id} ;;
    relationship: many_to_one
  }

  join: trial {
    type: left_outer
    sql_on: ${clinic_trial.trial_id} = ${trial.id} ;;
    relationship: many_to_one
  }
}

explore: data_query {
  join: source_data {
    type: left_outer
    sql_on: ${data_query.source_data_id} = ${source_data.id} ;;
    relationship: many_to_one
  }

  join: query_status {
    type: left_outer
    sql_on: ${data_query.query_status_id} = ${query_status.id} ;;
    relationship: many_to_one
  }

  join: pi_signature {
    type: left_outer
    sql_on: ${source_data.pi_signature_id} = ${pi_signature.id} ;;
    relationship: many_to_one
  }

  join: web_hook_answer_set {
    type: left_outer
    sql_on: ${source_data.web_hook_answer_set_id} = ${web_hook_answer_set.id} ;;
    relationship: many_to_one
  }

  join: subject {
    type: left_outer
    sql_on: ${source_data.subject_id} = ${subject.id} ;;
    relationship: many_to_one
  }

  join: source_status {
    type: left_outer
    sql_on: ${source_data.source_status_id} = ${source_status.id} ;;
    relationship: many_to_one
  }

  join: form {
    type: left_outer
    sql_on: ${source_data.form_id} = ${form.id} ;;
    relationship: many_to_one
  }

  join: clinic_trial {
    type: left_outer
    sql_on: ${subject.clinic_trial_id} = ${clinic_trial.id} ;;
    relationship: many_to_one
  }

  join: subject_status {
    type: left_outer
    sql_on: ${subject.subject_status_id} = ${subject_status.id} ;;
    relationship: many_to_one
  }

  join: clinic {
    type: left_outer
    sql_on: ${clinic_trial.clinic_id} = ${clinic.id} ;;
    relationship: many_to_one
  }

  join: trial {
    type: left_outer
    sql_on: ${clinic_trial.trial_id} = ${trial.id} ;;
    relationship: many_to_one
  }

  join: form_group {
    type: left_outer
    sql_on: ${form.form_group_id} = ${form_group.id} ;;
    relationship: many_to_one
  }
}

explore: form {
  join: subject {
    type: left_outer
    sql_on: ${form.subject_id} = ${subject.id} ;;
    relationship: many_to_one
  }

  join: trial {
    type: left_outer
    sql_on: ${form.trial_id} = ${trial.id} ;;
    relationship: many_to_one
  }

  join: form_group {
    type: left_outer
    sql_on: ${form.form_group_id} = ${form_group.id} ;;
    relationship: many_to_one
  }

  join: clinic_trial {
    type: left_outer
    sql_on: ${subject.clinic_trial_id} = ${clinic_trial.id} ;;
    relationship: many_to_one
  }

  join: subject_status {
    type: left_outer
    sql_on: ${subject.subject_status_id} = ${subject_status.id} ;;
    relationship: many_to_one
  }

  join: clinic {
    type: left_outer
    sql_on: ${clinic_trial.clinic_id} = ${clinic.id} ;;
    relationship: many_to_one
  }
}

explore: form_group {}

explore: pending_data_change {
  join: source_data {
    type: left_outer
    sql_on: ${pending_data_change.source_data_id} = ${source_data.id} ;;
    relationship: many_to_one
  }

  join: pending_data_changes {
    type: left_outer
    sql_on: ${pending_data_change.pending_data_changes_id} = ${pending_data_changes.id} ;;
    relationship: many_to_one
  }

  join: pi_signature {
    type: left_outer
    sql_on: ${source_data.pi_signature_id} = ${pi_signature.id} ;;
    relationship: many_to_one
  }

  join: web_hook_answer_set {
    type: left_outer
    sql_on: ${source_data.web_hook_answer_set_id} = ${web_hook_answer_set.id} ;;
    relationship: many_to_one
  }

  join: subject {
    type: left_outer
    sql_on: ${source_data.subject_id} = ${subject.id} ;;
    relationship: many_to_one
  }

  join: source_status {
    type: left_outer
    sql_on: ${source_data.source_status_id} = ${source_status.id} ;;
    relationship: many_to_one
  }

  join: form {
    type: left_outer
    sql_on: ${source_data.form_id} = ${form.id} ;;
    relationship: many_to_one
  }

  join: clinic_trial {
    type: left_outer
    sql_on: ${subject.clinic_trial_id} = ${clinic_trial.id} ;;
    relationship: many_to_one
  }

  join: subject_status {
    type: left_outer
    sql_on: ${subject.subject_status_id} = ${subject_status.id} ;;
    relationship: many_to_one
  }

  join: clinic {
    type: left_outer
    sql_on: ${clinic_trial.clinic_id} = ${clinic.id} ;;
    relationship: many_to_one
  }

  join: trial {
    type: left_outer
    sql_on: ${clinic_trial.trial_id} = ${trial.id} ;;
    relationship: many_to_one
  }

  join: form_group {
    type: left_outer
    sql_on: ${form.form_group_id} = ${form_group.id} ;;
    relationship: many_to_one
  }
}

explore: pending_data_changes {
  join: web_hook_answer_set {
    type: left_outer
    sql_on: ${pending_data_changes.web_hook_answer_set_id} = ${web_hook_answer_set.id} ;;
    relationship: many_to_one
  }

  join: subject {
    type: left_outer
    sql_on: ${pending_data_changes.subject_id} = ${subject.id} ;;
    relationship: many_to_one
  }

  join: clinic_trial {
    type: left_outer
    sql_on: ${subject.clinic_trial_id} = ${clinic_trial.id} ;;
    relationship: many_to_one
  }

  join: subject_status {
    type: left_outer
    sql_on: ${subject.subject_status_id} = ${subject_status.id} ;;
    relationship: many_to_one
  }

  join: clinic {
    type: left_outer
    sql_on: ${clinic_trial.clinic_id} = ${clinic.id} ;;
    relationship: many_to_one
  }

  join: trial {
    type: left_outer
    sql_on: ${clinic_trial.trial_id} = ${trial.id} ;;
    relationship: many_to_one
  }
}

explore: pi_signature {
  join: web_hook_answer_set {
    type: left_outer
    sql_on: ${pi_signature.web_hook_answer_set_id} = ${web_hook_answer_set.id} ;;
    relationship: many_to_one
  }
}

explore: query_response {}

explore: query_status {}

explore: source_data {
  join: pi_signature {
    type: left_outer
    sql_on: ${source_data.pi_signature_id} = ${pi_signature.id} ;;
    relationship: many_to_one
  }

  join: web_hook_answer_set {
    type: left_outer
    sql_on: ${source_data.web_hook_answer_set_id} = ${web_hook_answer_set.id} ;;
    relationship: many_to_one
  }

  join: subject {
    type: left_outer
    sql_on: ${source_data.subject_id} = ${subject.id} ;;
    relationship: many_to_one
  }

  join: source_status {
    type: left_outer
    sql_on: ${source_data.source_status_id} = ${source_status.id} ;;
    relationship: many_to_one
  }

  join: form {
    type: left_outer
    sql_on: ${source_data.form_id} = ${form.id} ;;
    relationship: many_to_one
  }

  join: clinic_trial {
    type: left_outer
    sql_on: ${subject.clinic_trial_id} = ${clinic_trial.id} ;;
    relationship: many_to_one
  }

  join: subject_status {
    type: left_outer
    sql_on: ${subject.subject_status_id} = ${subject_status.id} ;;
    relationship: many_to_one
  }

  join: clinic {
    type: left_outer
    sql_on: ${clinic_trial.clinic_id} = ${clinic.id} ;;
    relationship: many_to_one
  }

  join: trial {
    type: left_outer
    sql_on: ${clinic_trial.trial_id} = ${trial.id} ;;
    relationship: many_to_one
  }

  join: form_group {
    type: left_outer
    sql_on: ${form.form_group_id} = ${form_group.id} ;;
    relationship: many_to_one
  }
}

explore: source_status {}

explore: subject {
  join: clinic_trial {
    type: left_outer
    sql_on: ${subject.clinic_trial_id} = ${clinic_trial.id} ;;
    relationship: many_to_one
  }

  join: subject_status {
    type: left_outer
    sql_on: ${subject.subject_status_id} = ${subject_status.id} ;;
    relationship: many_to_one
  }

  join: clinic {
    type: left_outer
    sql_on: ${clinic_trial.clinic_id} = ${clinic.id} ;;
    relationship: many_to_one
  }

  join: trial {
    type: left_outer
    sql_on: ${clinic_trial.trial_id} = ${trial.id} ;;
    relationship: many_to_one
  }
}

explore: subject_status {}

explore: trial {}

explore: user_trial_assignment {
  join: trial {
    type: left_outer
    sql_on: ${user_trial_assignment.trial_id} = ${trial.id} ;;
    relationship: many_to_one
  }
}

explore: vendor {}

explore: vendor_type {}

explore: web_hook_answer_set {}
