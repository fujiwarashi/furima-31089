# テーブル設計

## users テーブル

| Column                      | Type        | Options                  |
| --------------------------- | ----------- | ------------------------ |
| nickname                  	| string     	| null: false           	 |
| email                     	| string     	| null: false,unique: true |
| password                  	| string     	| null: false              |
| last_name                 	| string     	| null: false              |
| first_name                	| string     	| null: false              |
| last_name_kana            	| string     	| null: false              |
| first_name_kana           	| string     	| null: false              |
| birthday                  	| date       	| null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                      | Type        | Options             |
| --------------------------- | ----------- | ------------------- |
| item_name                 	| string     	| null: false       	|
| item_text                 	| text       	| null: false       	|
| category                  	| integer    	| null: false       	|
| item_status               	| integer    	| null: false       	|
| shipping_fee              	| integer    	| null: false       	|
| item_prefecture           	| integer    	| null: false       	|
| scheduled_delivery        	| integer    	| null: false       	|
| price                     	| integer    	| null: false       	|
| user                      	| references 	| foreign_key: true 	|

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column                      | Type        | Options             |
| --------------------------- | ----------- | ------------------- |
| user                      	| references 	| foreign_key: true 	|
| order                     	| references 	| foreign_key: true 	|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column                      | Type        | Options             |
| --------------------------- | ----------- | ------------------- |
| postal_code               	| integer    	| null:false        	|
| prefecture                	| integer    	| null:false        	|
| city                      	| string     	| null:false        	|
| house_number              	| string     	| null:false        	|
| building_name             	| string     	|                   	|
| telephone                 	| string     	| null:false        	|
| order                     	| references 	| foreign_key: true 	|

### Association

- belongs_to :order