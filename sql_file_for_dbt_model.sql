-- customers data for dbt model
with customer_data as (
  select
    customers.id as customer_id,
    customers.name as customer_name,
    customers.address as customer_address,
    customers.city as customer_city,
    customers.state as customer_state,
    customers.zip as customer_zip,
    customers.phone as customer_phone,
    customers.email as customer_email,
    orders.id as order_id,
    orders.order_date as order_date,
    orders.shipped_date as shipped_date,
    orders.status as status,
    order_items.id as order_item_id,
    order_items.product_id as product_id,
    order_items.quantity as quantity,
    order_items.price as price,
    products.name as product_name,
    products.description as product_description,
    products.price as product_price,
    products.stock as product_stock,
    products.image as product_image
  from customers
  join orders on customers.id = orders.customer_id
  join order_items on orders.id = order_items.order_id
  join products on order_items.product_id = products.id
)



select * from customers_data;
