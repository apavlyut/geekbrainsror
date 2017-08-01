require "application_system_test_case"

class WelcomesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    assert_text "Хеллоу ворлд"
  end

  test "публикация постов" do
    # setup

    post_attrs = attributes_for :post

    # Заходим в админку
    visit root_path
    # Выбираем "посты"
    click_on 'Посты'
    # Нажимаем "добавить пост"
    click_on 'Добавить пост'
    # Заполняем форму и сохраняем

    fill_in 'post_title', with: post_attrs[:title]
    fill_in 'post_announce', with: post_attrs[:announce]
    fill_in 'post_body', with: post_attrs[:body]

    click_on 'Сохраниь пост'
    # Видим в админке перед публикацией
    
    assert_text post_attrs[:title]
    assert_text post_attrs[:announce]
    assert_text post_attrs[:body]

    # На главной нет неопубликованного поста
    click_on 'Главная'
    assert_no_text post_attrs[:title]

    # Выбираем "посты"
    click_on 'Посты'
    # возвращаемся к посту
    click_on post_attrs[:title]
    # Нажимаем "опубликовать"
    click_on 'Опубликовать'
    # видим отметку "опубликовано"
    assert_text 'Опубликовано'
    # На главной теперь

    click_on 'Главная'
    # виден заголовок и анонс поста
    assert_text post_attrs[:title]
    assert_text post_attrs[:announce]

  end
end
