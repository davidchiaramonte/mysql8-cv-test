connection: "david-chiaramonte-test"

# include all the views
include: "/views/**/*.view"

datagroup: david_c_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: david_c_test_default_datagroup

explore: cities {
  join: states {
    type: left_outer
    sql_on: ${cities.state_id} = ${states.id} ;;
    relationship: many_to_one
  }
}

explore: countries {}

explore: states_test {}

explore: states {}
