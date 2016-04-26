## README
---
**Example Store**

РЕАЛИЗОВАНО

* Main page На главной странице должны быть:  
  + Список категорий (вложенных категорий нет)
  + Форма поиска
  + Ссылка на корзину
* Category List При клике на категорию пользователь видит:
  + список книг в категории с разбивкой на страницы в случае, если книг больше 10.
  + Пользователь может отсортировать список по новизне, по цене, по популярности.
  + Популярность книги определяется количеством покупок этой книги.
  + Каждая книга в списке содержит:
    + Название
    + Список авторов
    + Год издания
    + Краткое описание (обрезанное до 420 символов)
    + Цену
    + Кнопку “Купить
* Search При использовании формы поиска пользователь видит
  * список, аналогичный списку при поиске по категориям
  * в дополнение показывается список категорий с количеством найденных в категории книг.
* Search by Author При клике на имя автора пользователь видит список, аналогичный списку при поиске по 
категориям
  * в дополнение показывается список категорий с количеством  найденных в 
категории книг искомого автора.
  * также показывается описание автора
* Book Detail На детальной странице книги присутствуют:
  * Название
  * Список авторов
  * Цена
  * Кнопка “Купить”
  * Маркер “Есть в наличии” + Количество книг в наличии(совмещено)
  * Год издания
  * ISBN
  * Полное описание книги
* Cart При клике на кнопку “Купить” книга помещается в корзину пользователя и
  * пользователь сразу же попадает на страницу “Корзина”, где видит:
    * Список книг в корзине
    * Общую сумму покупки
    * Кнопку “Оформить заказ”
    * Кнопку “Продолжить покупки”
  * При нажатии кнопки “Оформить заказ” пользователь попадает на страницу оформления 
заказа,
    * где он должен ввести полное имя и адрес и нажать кнопку “Подтвердить заказ” 
или “Отменить заказ”.
    * При нажатии “Подтвердить заказ” заказ сохраняется в базе.
* Orders List На сайте должна быть панель администратора. 
  * Администратор может залогиниться в панель администратора 
  * просмотреть все оформленные заказы. 
  * Администратор должен иметь возможность выполнить над заказом такие операции:
    * Просмотреть детали, включая список книг, сумму, информацию о заказчике
    * Отправить заказ (заказ отмечается как “Отправленный”)
    * Отклонить заказ (заказ отмечается как “Отклоненный”)

РЕАЛИЗОВАНО доп
  * Администратор может редактировать списки
    * книг
    * авторов
    * жанров
    * пользователей
  * Частичные тесты моделей
  * Регистрация и личный кабинет ползователя


НЕ РЕАЛИЗОВАНО
  * интернационализация
  * полное покрытие тестами
  * Ajax
    
