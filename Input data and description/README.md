# Описание входных данных

В данном наборе данных представлены 5 файлов о продажах торгового отдела. Данные содержат продажи с 21.07.2009 по 29.03.2013.

#### 1. orders.csv - информация о продажах торгового отдела:
  * `order_id` - id заказа
  * `order_date` - дата заказа
  * `customer_id` - id покупателя
  * `employee_id` - id работника
  * `shipper_id` - id перевозчика
  * `product_id` - id товара
  * `sales` - стоимость продажи
  * `costs` - стоимость закупки
  * `profit` - прибыль
  * `quantity` - количество
  * `discount` - скидка
  * `freight` - стоимость доставки
  
#### 2. categories.csv - информация о товарах
  * `category_id` - id категории
  * `category` - название категории
  * `description` - описание категории 

#### 3. products.csv - информация о товарах 
  * `products_id` - id товара
  * `category_id` - id категории
  * `product` - название товара
  * `supplier_id` - id поставщика

#### 4. suppliers.csv - информация о поставщиках
  * `supplier_id` - id поставщика
  * `supplier` - название поставщика
  * `supplier_contact` - контактное лицо
  * `supplier_country` - страна поставщик
  
#### 5. employees.csv - информация о работниках
  * `employee_id` - id работника
  * `employee_name` - имя работника
  * `office` - отдел
  * `reports_to` - id начальника
  * `title` - должность
  
