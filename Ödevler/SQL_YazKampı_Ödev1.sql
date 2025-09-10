CREATE TABLE books (
    book_id INT PRIMARY KEY IDENTITY,
    title NVARCHAR(255) NOT NULL,
    author NVARCHAR(255) NOT NULL,
    genre NVARCHAR(50),
    price DECIMAL(10,2) CHECK (price > 0),
    stock INT CHECK (stock >= 0),
    published_year INT CHECK (published_year BETWEEN 1900 AND 2025),
    added_at DATE
);

INSERT INTO books (title, author, genre, price, stock, published_year, added_at) VALUES
(N'Kayıp Zamanın İzinde', N'M. Proust', N'roman', 129.90, 25, 1913, '2025-08-20'),
(N'Simyacı', N'P. Coelho', N'roman', 89.50, 40, 1988, '2025-08-21'),
(N'Sapiens', N'Y. N. Harari', N'tarih', 159.00, 18, 2011, '2025-08-25'),
(N'İnce Memed', N'Y. Kemal', N'roman', 99.90, 12, 1955, '2025-08-22'),
(N'Körlük', N'J. Saramago', N'roman', 119.00, 7, 1995, '2025-08-28'),
(N'Dune', N'F. Herbert', N'bilim', 149.00, 30, 1965, '2025-09-01'),
(N'Hayvan Çiftliği', N'G. Orwell', N'roman', 79.90, 55, 1945, '2025-08-23'),
(N'1984', N'G. Orwell', N'roman', 99.00, 35, 1949, '2025-08-24'),
(N'Nutuk', N'M. K. Atatürk', N'tarih', 139.00, 20, 1927, '2025-08-27'),
(N'Küçük Prens', N'A. de Saint-Exupéry', N'çocuk', 69.90, 80, 1943, '2025-08-26'),
(N'Başlangıç', N'D. Brown', N'roman', 109.00, 22, 2017, '2025-09-02'),
(N'Atomik Alışkanlıklar', N'J. Clear', N'kişisel gelişim', 129.00, 28, 2018, '2025-09-03'),
(N'Zamanın Kısa Tarihi', N'S. Hawking', N'bilim', 119.50, 16, 1988, '2025-08-29'),
(N'Şeker Portakalı', N'J. M. de Vasconcelos', N'roman', 84.90, 45, 1968, '2025-08-30'),
(N'Bir İdam Mahkûmunun Son Günü', N'V. Hugo', N'roman', 74.90, 26, 1929, '2025-08-31')

-- 1. Tüm kitapların title, author, price alanlarını fiyatı artan şekilde sıralayarak listeleyin.
SELECT title, author, price FROM books ORDER BY price ASC;

-- 2. Türü 'roman' olan kitapları A→Z title sırasıyla gösterin.
SELECT title, author, genre FROM books WHERE genre = N'roman' ORDER BY title ASC;

-- 3. Fiyatı 80 ile 120 (dahil) arasındaki kitapları listeleyin (BETWEEN).
SELECT * FROM books WHERE price BETWEEN 80 AND 120;

-- 4. Stok adedi 20’den az olan kitapları bulun (title, stock_qty).
SELECT title, stock FROM books WHERE stock < 20;

-- 5. title içinde 'zaman' geçen kitapları LIKE ile filtreleyin (büyük/küçük harf durumunu not edin).
SELECT * FROM books WHERE title LIKE N'%zaman%';

-- 6. genre değeri 'roman' veya 'bilim' olanları IN ile listeleyin.
SELECT * FROM books WHERE genre IN (N'roman', N'bilim');

-- 7. published_year değeri 2000 ve sonrası olan kitapları, en yeni yıldan eskiye doğru sıralayın.
SELECT * FROM books WHERE published_year >= 2000 ORDER BY published_year DESC;

-- 8. Son 10 gün içinde eklenen kitapları bulun (added_at tarihine göre).
SELECT * FROM books WHERE added_at >= DATEADD(DAY, -10, CAST(GETDATE() AS DATE));

-- 9. En pahalı 5 kitabı price azalan sırada listeleyin (LIMIT 5).
SELECT TOP 5 * FROM books ORDER BY price DESC;

-- 10. Stok adedi 30 ile 60 arasında olan kitapları price artan şekilde sıralayın.
SELECT * FROM books WHERE stock BETWEEN 30 AND 60 ORDER BY price ASC;