# == Objects ===
# Open classes

class MyClass
  def method_name
    "hello"
  end
end

def MyClass.method_name
  "hi"
end

def MyClass.method_name_new
  "hi 2"
end

# print our instance methods
puts MyClass.instance_methods(false)

# print all methods so we can see all defined methods - singleton and instance
puts MyClass.methods(false)

# puts MyClass.method_name_new

# Object and Class
# class MyClass
#   def initialize
#     @myvar = 1
#   end
# end
# Kernel and gem

# module Kernel
#   def gem(name, version)
#     puts "installing gem #{name} with verison #{version}"
#   end
# end

# self context > yehuda

# class Person
#   def self.species
#     "Homo Sapien"
#   end
# end
#
# puts Person.species
#
# class Person
#   class << self
#     def species
#       "Homo Sapien"
#     end
#   end
# end
#
# puts Person.species
#
# class << Person
#   def species
#     "Homo Sapien"
#   end
# end
#
# puts Person.species
#
# Person.instance_eval do
#   def species
#     "Homo Sapien"
#   end
# end
#
# puts Person.species
#
# def Person.species
#   "Homo Sapien"
# end
#
# puts Person.species

# class MyClass
#   def self.name
#     "name of class is MyClass"
#   end
#   puts name
# end

# mc = MyClass.new
# puts mc.name

# === Methods ===
# Duplication problem

# class PersonInformator
#
#   def initialize(sex = 'man')
#     @sex = sex
#   end
#
#   def show_man_size
#     puts "74m"
#   end
#
#   def show_man_hair_color
#     puts "red"
#   end
#
#   def show_man_age
#     puts "75"
#   end
#
#   def show_man_pants_color
#     puts "green"
#   end
#
#   def show_woman_size
#     puts "74m"
#   end
#
#   def show_woman_hair_color
#     puts "red"
#   end
#
#   def show_woman_age
#     puts "75"
#   end
#
#   def show_woman_pants_color
#     puts "green"
#   end
#
#   def my_method(name, *sex)
#     #code
#     puts "name: #{name}"
#     puts "sex: #{sex.inspect}"
#   end
#
#   def method_missing(name, *arguments)
#     puts "name: #{name}, args: #{arguments.inspect}"
#     # raise NoMethodError
#     define_method name.to_sym do |*args|
#       puts "this is defined method: #{name}"
#     end
#   end
# end

# pi = PersonInformator.new
#
# pi.show_human_age(1,2,3,4)
#
# puts pi.methods.include? :show_human_age
# require 'ostruct'
#
# person = OpenStruct.new
# puts person.inspect
# person.name = 'Alex'
# puts person.inspect
# puts person.name

# pi.my_method('mane',3, 4)
# Dynamic methods
# Method missing
# === Blocks ===
# yield
# block_given?
# def show_time(&our_given_block)
#   t = Time.now
#   if block_given?
#     yield(t)
#   else
#     puts "just time: #{t}"
#   end
#   puts our_given_block.inspect
#   our_given_block.call('123123') # raise
# end
#
# t = 'this is new t'
# show_time{|passed_time| puts("This is passed time #{passed_time} and #{t}")}
# # show_time
#
# Rails.application.configure do |config|
#   config.url = "yandex.ru"
# end
#
# event :started do
# end
#
# namespace :production do
#   task :run_server do
#   end
# end
# closure - calls what you give
# instance_eval - eval in context of object
# callable objects - proc, lambda, &operation
# code writes code - define method
# === hooks ===
# inherited
#
# class Person
#   def self.inherited(child_class)
#     puts "Hello im going to be inherited"
#     super
#   end
# end
#
# module Arms
#   def self.included(base)
#     puts "Now you are have arms"
#     base.extend(ClassMethods)
#   end
#
#   def my_instance_method
#     puts "Hello from instance of Arms"
#   end
#
#   module ClassMethods
#     def hellofromclass
#       puts "hellow from class"
#     end
#   end
#
# end
#
# class Alex < Person
#   include Arms
# end
#
# puts "Loaded"
# puts Alex.hellofromclass
# puts Alex.new.my_instance_method
#
# def one
#   puts "one"
# end
#
# def one
#   puts "two"
# end
#
# one
# included - include and extend in Module
# extended
# === Meta Rails ===
# ar attributes

# # name: string
# # email: stirng
# # description: text
# class Person < AR::Base
#
#   validates :name, presence: true
#
#   def name
#     @name # reads from db
#   end
#
#   def name(new_name)
#     @name = new_name
#   end
#
# end
#
# p = Person.new(name: 'Alex')
#
# p.save!
# alex = Person.where(name: 'Alex', email: 'alex@deppkind.com') # Relation
# ar finders
