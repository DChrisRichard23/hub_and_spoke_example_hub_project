# connection: "super_store"

include: "/views/*.view.lkml"
include: "/models/hub_and_spoke_example_hub_project.model.lkml"

explore: new_explore {
  extends: [superstore_orders]
  view_name: superstore_orders
  join: order_date_table {
    type: left_outer
    relationship: many_to_one
    sql_on: ${superstore_orders.order_date} = ${order_date_table.date_date} ;;
  }
  join: ship_date_table {
    type: left_outer
    relationship: many_to_one
    sql_on: ${superstore_orders.ship_date} = ${ship_date_table.date_date} ;;
  }
}
