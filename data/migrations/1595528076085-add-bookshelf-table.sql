Database Migration
Query 1: CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

Query 2: INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

Query 3: ALTER TABLE books ADD COLUMN bookshelf_id INT;

Query 4: UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

This query will prepare a connection between the two tables. It works by running a subquery for every row in the books table. The subquery finds the bookshelf row that has a name matching the current book’s bookshelf value. The id of that bookshelf row is then set as the value of the bookshelf_id property in the current book row.
Confirm the success of this command by typing SELECT bookshelf_id FROM books; in your SQL shell. The result should display a column containing the unique ids for the bookshelves. The numbers should match the total number returned from Query 2 when you confirmed the success of the insertion of names into the bookshelves table.
Query 5: ALTER TABLE books DROP COLUMN bookshelf;

This query will modify the books table by removing the column named bookshelf. Now that the books table contains a bookshelf_id column which will become a foreign key, your table does not need to contain a string representing each bookshelf.
Confirm the success of this command by typing \d books in your SQL shell. The books table schema should be updated to reflect the schema provided above, without the bookshelf column.
Query 6: ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);

This query will modify the data type of the bookshelf_id in the books table, setting it as a foreign key which references the primary key in the bookshelves table. Now PostgreSQL knows HOW these 2 tables are connected.
Confirm the success of this command by typing \d books in your SQL shell. You should see details about the foreign key constraints, as shown in the schema above.