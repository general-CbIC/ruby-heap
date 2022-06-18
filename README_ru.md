# Heap (ruby сортировка кучей)

[![Gem Version](https://badge.fury.io/rb/ruby-heap.svg)](https://badge.fury.io/rb/ruby-heap)
[![Code Climate](https://codeclimate.com/github/pups3s/ruby-heap/badges/gpa.svg)](https://codeclimate.com/github/pups3s/ruby-heap)

# Heap (ruby сортировка кучей)
Библиотека используется для создания структуры Heap и сортировки по [алгоритму Heapsort](https://ru.wikipedia.org/wiki/%D0%9F%D0%B8%D1%80%D0%B0%D0%BC%D0%B8%D0%B4%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F_%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0).

## Установка

Добавьте данную строчку в Gemfile Вашего приложения:

```ruby
gem 'ruby-heap'
```

Затем выполните:

```bash
bundle
```

Или установите библиотеку отдельно, выполнив:

```bash
gem install ruby-heap
```

## Использование

### Двоичные кучи

#### Двоичная куча с минимальным корнем

Во время инициализации (и после создания кучи) Вы можете добавить в нее любые сравниваемые объекты (не только числа).
Используемые объекты должны иметь функции сравнения (>, >=, <, <=).

```ruby
require 'Heap'

# Инициализация
b_heap = Heap::BinaryHeap::MinHeap.new([2, 3, 1, -1])

# Получение элементов кучи (доступ только для чтения)
b_heap.elements     # [-1, 1, 3, 2]

# Получение отсортированных элементов кучи без
# изменения её элементов
b_heap.sort         # [-1, 1, 2, 3]

# Количество элементов в куче
b_heap.count        # 4

# Получение минимального элемента без удаления его из кучи
b_heap.extract_min  # -1

# Получение минимального элемента и его удаление из кучи
b_heap.extract_min! # -1
b_heap.count        # 3
b_heap.elements     # [1, 2, 3]

# Также Вы можете добавить новые элементы с помощью
# функции add
b_heap.add -1
b_heap.elements     # [-1, 1, 3, 2]
b_heap.add [0, 9, 200, -15, 6]
b_heap.elements     # [-15, -1, 3, 0, 1, 9, 200, 2, 6]
b_heap.sort         # [-15, -1, 0, 1, 2, 3, 6, 9, 200]
```

#### Те же действия с кучей (с максимальным корнем)

```ruby
require 'Heap'

# Инициализация
b_heap = Heap::BinaryHeap::MaxHeap.new([2, 3, 1, -1])

# Получение элементов кучи (доступ только для чтения)
b_heap.elements     # [3, 2, 1, -1]

# Получение отсортированных элементов кучи без
# изменения её элементов
b_heap.sort         # [3, 2, 1, -1]

# Количество элементов в куче
b_heap.count        # 4

# Получение максимального элемента без удаления его из кучи
b_heap.extract_max  # 3

# Получение максимального элемента и его удаление из кучи
b_heap.extract_max! # 3
b_heap.count        # 3
b_heap.elements     # [2, -1, 1]

# Также Вы можете добавить новые элементы с помощью
# функции add
b_heap.add -1
b_heap.elements     # [2, -1, 1, -1]
b_heap.add [0, 9, 200, -15, 6]
b_heap.elements     # [200, 6, 9, 0, -1, 1, 2, -15, -1]
b_heap.sort         # [200, 9, 6, 2, 1, 0, -1, -1, -15]
```

#### Слияние куч

```ruby
require 'Heap'

# Инициализация
min_heap = Heap::BinaryHeap::MinHeap.new [1, 2, 3]
max_heap = Heap::BinaryHeap::MaxHeap.new [9, -1, 4]

# Слияние
min_heap.add max_heap

min_heap.count    # 6
min_heap.sort     # [-1, 1, 2, 3, 4, 9]
```

### Многомерные кучи

Многомерные (d-ичные) кучи имеют **те же методы, что и бинарные**. Однако, отличается инициализация:

```ruby
require 'Heap'

# Первый параметр - измерение кучи (d)
# Второй параметр опционален и может содержать первые элементы в куче
min_heap = Heap::MultipleHeap::MinHeap.new(5, [10, 20, 30])
max_heap = Heap::MultipleHeap::MaxHeap.new(7)
```

## Вклад в проект

**Баг репорты** и **pull реквесты** приветствуются на GitHub [Страница проекта](https://github.com/pups3s/ruby-heap).

## Лицензия

Библиотека является open source и регламентируется [MIT License](http://opensource.org/licenses/MIT).
