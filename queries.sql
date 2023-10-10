use yeticave;

/*запросы для добавления информации в БД*/
INSERT INTO categories (character_code, name_category)
VALUES
    ('boards', 'Доски и лыжи'),
    ('attachment', 'Крепления'),
    ('boots','Ботинки'),
    ('clothing','Одежда'),
    ('tools', 'Инструменты'),
    ('other','Разное');

INSERT INTO users (email, user_name, user_password, contact)
VALUES
    ('test1@mail.ru', 'ivan ivanov', 'password_1', '+71111111111'),
    ('test2@mail.ru', 'petr petrov', 'password_2', '+72222222222'),
    ('test3@mail.ru', 'sidor sidorov', 'password_3', '+73333333333');

INSERT INTO lots (lot_name, lot_image, lot_price, date_expiration, category_id, user_id, rate_interval)
VALUES ('2014 Rossignol District Snowboard', 'img/lot-1.jpg', 10999, '2023-04-21', 1, 2, 200),
       ('DC Ply Mens 2016/2017 Snowboard', 'img/lot-2.jpg', 159999, '2023-04-22', 1, 1, 200),
       ('Крепления Union Contact Pro 2015 года размер L/XL', 'img/lot-3.jpg', 8000, '2023-04-21', 2, 1, 100),
       ('Ботинки для сноуборда DC Mutiny Charocal', 'img/lot-4.jpg', 10999, '2023-04-21', 3, 3, 150),
       ('Куртка для сноуборда DC Mutiny Charocal', 'img/lot-5.jpg', 7500, '2023-04-21', 4, 2, 100),
       ('Маска Oakley Canopy', 'img/lot-6.jpg', 5400, '2023-04-21', 6, 3, 150);

INSERT INTO rates (user_price, user_id, lot_id)
VALUES (17500, 1, 2),
       (11300, 2, 1),
       (8100, 1, 5);
       (12300, 2, 1),
       (1300, 1, 1);

/*запросы на получение данных из БД*/
/*получить все категории*/
SELECT name_category AS 'Категории' FROM categories;
/*получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, название категории*/
SELECT lots.lot_name, lots.lot_price, lots.lot_image, categories.name_category
FROM lots JOIN categories ON lots.category_id=categories.id;
/*показать лот по его ID. Получите также название категории, к которой принадлежит лот*/
SELECT lots.id, lots.lot_name, lots.lot_image, lots.lot_price, lots.lot_expiration
FROM lots JOIN categories ON lots.category_id=categories.id
WHERE lots.id=2;
/*обновить название лота по его идентификатору*/
UPDATE lots
SET lot_name='Маска сноубордическая Oakley Canopy'
WHERE id=6;
/*получить список ставок для лота по его идентификатору с сортировкой по дате.*/
SELECT rates.rate_datetime, rates.user_price, lots.lot_name, users.user_name
FROM rates
JOIN lots ON rates.lot_id=lots.id
JOIN users ON rates.user_id=users.id
WHERE lots.id=1
ORDER BY rates.rate_datetime DESC;
