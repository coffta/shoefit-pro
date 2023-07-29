# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| nickname | string | null: false |
| encrypted_password | string | null: false |
| email | string | null: false, unique: true |
| name | string | null: false |
| address | string | null: false |
| phone_number | string | null: false |

### Association
- has_many :customers
- has_many :records

## customersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| user（FK) | references | null: false, foreign_key: true |
| customer_name | string | null: false |
| customer_address | string ||
| date_of_birth | string ||
| customer_phone_number | string ||
| customer_email |  ||
| occupation | string ||
| sex | string ||
| memo | text ||

### Association
- belongs_to :user
- has_many :record

## recordsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| user（FK) | references | null: false, foreign_key: true |
| customer（FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :customer
- has_many :paper_records
- has_many :foot_images
- has_many :walking_movies
- has_many :shoe_sizes


## paper_recordsテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| record(FK) | references | null: false , foreign_key: true|
| paper_records_date | string ||

### Association
- belongs_to :record

## foot_imagesテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| record(FK) | references | null: false , foreign_key: true|
| foot_image_date | string ||

### Association
- belongs_to :record

## walking_moviesテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| record(FK) | references | null: false , foreign_key: true|
| walking_movie_date | string ||

### Association
- belongs_to :record

## shoe_sizesテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| record(FK) | references | null: false , foreign_key: true|
| foot_length | integer ||
| foot_width | string ||

### Association
- belongs_to :record
- has_one :measured_values

## measured_valuesテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| shoe_size(FK) | references | null: false , foreign_key: true|
| sexorchild | string | null: false |
| foot_shape | string | null: false |
| foot_length_left | integer | null: false |
| foot_length_right | integer | null: false |
| foot_girth_load_left | integer | null: false |
| foot_girth_load_right | integer | null: false |
| foot_girth_nonload_left | integer | null: false |
| foot_girth_nonload_right | integer | null: false |
| foot_width_load_left | integer | null: false |
| foot_width_load_right | integer | null: false |
| foot_width_nonload_left | integer | null: false |
| foot_width_nonload_right | integer | null: false |

### Association
- belongs_to :shoe_size

end
