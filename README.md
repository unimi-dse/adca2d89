# Sentimeter

This package provides a toolkit for the _Italian Amazon (www.amazon.it)_. The tools this package provides, so far, is giving ASIN, number of reviews, scraping reviews, analyzing sentiment of reviews using exclusive lexicon made for this package.

## Installation

```R
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/adca2d89')
```

## Usage

```R
# load the package
require(sentimeter)
```

### Get ASIN

The function `get_asin()` gives the _ASIN_ of every product using the web address of the product. An **Amazon Standard Identification Number** (ASIN) is a 10-character alphanumeric unique identifier assigned by Amazon.it and its partners for product identification within the Amazon organization.

__Note__: This function designed to work with Italian Amazon, so it may not work with Amazon of other countries.

```R
sentimeter::get_asin("https://www.amazon.it/Tutti-gli-scritti-Platone/dp/8845290034")
```

### Number of Reviews

The function `number_of_reviews()` is a tool to know how many reviews are written for a specific product on amazon.it. It is much better than the number provided by Amazon, because it ignores reviews without any title or text (only stars) that are of very low quality. The input of this function is the ASIN of the product.

```R
sentimeter::number_of_reviews("8845290034")
```

### Scrape Reviews

The function `scrape_reviews()` scrapes reviews that users wrote for products on amazon.it. The inputs are ASIN and the page number and the output is a data frame consist of title, content and given star of the reviews.

```R
sentimeter::scrape_reviews("8845290034", 1)
```

### Term Sentiment

The function `term_sentiment()` gives the sentiment coefficient for given term from the sentiment lexicon that package provides. This lexicon are made exclusively for this package from analyzing some hundres of thousands of reviews on amazon.it.

```R
sentimeter::term_sentiment("perfetto")
```

### Document Sentiment

The function `document_sentiment()` analyzes the sentiment of the given document. The approach used is "bag of the words" and nagative phrases like "non funziona" are compounded. The output is a list that consistes sentimate, number of effective terms and the list of effective terms.

```R
sentimeter::document_sentiment("Questo prodotto non funziona. È inutile. Che peccato!")
```

### Graphical User Interface

The function `GUI()` is used to call the Shiny app to interact with the user. There is a box to receive the address of the product and the analysis will shown in the main area of the page.

```R
sentimeter::GUI()
```
