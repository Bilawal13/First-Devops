import 'package:bookly/models/books_model.dart';
import 'package:bookly/models/model.dart';
import 'package:flutter/material.dart';

const availableCategories = [
  Model(id: 'c1', title: 'Fantasy', color: Colors.purple),
  Model(id: 'c2', title: 'Horror', color: Colors.red),
  Model(id: 'c3', title: 'Adventure', color: Colors.orange),
  Model(id: 'c4', title: 'Science Fiction', color: Colors.amber),
  Model(id: 'c5', title: 'Action', color: Colors.blue),
  Model(id: 'c6', title: 'Romance', color: Colors.green),
  Model(id: 'c7', title: 'Thriller', color: Colors.lightBlue),
];

const dummyBooks = [
  BooksModel(
    id: 'm1',
    categories: ['c1', 'c2'],
    title: 'Stephen King - IT',
    price: 9.99,
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1334416842i/830502.jpg',
  ),
  BooksModel(
    id: 'm2',
    categories: ['c1', 'c3'],
    title: 'The Lord of the Rings',
    price: 15.99,
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1566425108i/33.jpg',
  ),
  BooksModel(
    id: 'm3',
    categories: ['c5'],
    title: 'Ben 10 - Alien Force',
    price: 7.50,
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1320466595i/5092160.jpg',
  ),
  BooksModel(
    id: 'm4',
    categories: ['c6'],
    title: 'Summer Romance',
    price: 8.25,
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1698303672i/198563734.jpg',
  ),
  BooksModel(
    id: 'm5',
    categories: ['c7'],
    title: 'So Thrilled For You',
    price: 12.40,
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1718547362i/214868013.jpg',
  ),
  BooksModel(
    id: 'm6',
    categories: ['c6'],
    title: 'Table for One',
    price: 10.00,
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1762184486i/233423405.jpg',
  ),
  BooksModel(
    id: 'm7',
    categories: ['c3'],
    title: 'The Adventures of Huckleberry Finn',
    price: 6.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/6/61/Huckleberry_Finn_book.JPG',
  ),
  BooksModel(
    id: 'm8',
    categories: ['c4'],
    title: 'Consider Yourself Kissed',
    price: 11.75,
    imageUrl:
        'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1546096879i/2956.jpg',
  ),

  // NEW BOOKS
  BooksModel(
    id: 'm9',
    categories: ['c1'],
    title: 'Harry Potter and the Sorcerer\'s Stone',
    price: 13.99,
    imageUrl: 'https://m.media-amazon.com/images/I/81YOuOGFCJL.jpg',
  ),
  BooksModel(
    id: 'm10',
    categories: ['c4'],
    title: 'Dune',
    price: 14.50,
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/91uwocAMtSL.jpg',
  ),
  BooksModel(
    id: 'm11',
    categories: ['c7'],
    title: 'The Girl with the Dragon Tattoo',
    price: 12.30,
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/81af+MCATTL.jpg',
  ),
  BooksModel(
    id: 'm12',
    categories: ['c3'],
    title: 'Treasure Island',
    price: 7.99,
    imageUrl: 'https://m.media-amazon.com/images/I/81m1s4wIPML.jpg',
  ),
  BooksModel(
    id: 'm13',
    categories: ['c2'],
    title: 'The Shining',
    price: 10.90,
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/81WcnNQ-TBL.jpg',
  ),
  BooksModel(
    id: 'm14',
    categories: ['c6'],
    title: 'Pride and Prejudice',
    price: 9.20,
    imageUrl: 'https://m.media-amazon.com/images/I/91HHqVTAJQL.jpg',
  ),
  BooksModel(
    id: 'm15',
    categories: ['c5'],
    title: 'The Bourne Identity',
    price: 11.45,
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/91VokXkn8hL.jpg',
  ),
  BooksModel(
    id: 'm16',
    categories: ['c1'],
    title: 'The Hobbit',
    price: 12.80,
    imageUrl: 'https://m.media-amazon.com/images/I/91b0C2YNSrL.jpg',
  ),
  BooksModel(
    id: 'm17',
    categories: ['c4'],
    title: 'Ender\'s Game',
    price: 10.60,
    imageUrl: 'https://m.media-amazon.com/images/I/81gTwYAhU7L.jpg',
  ),
  BooksModel(
    id: 'm18',
    categories: ['c7'],
    title: 'Gone Girl',
    price: 13.10,
    imageUrl: 'https://m.media-amazon.com/images/I/81dQwQlmAXL.jpg',
  ),
];
