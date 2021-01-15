#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan 15 16:34:39 2021

@author: jahid
"""
# Streamlit Stock price apps- Tesla
import yfinance as yf
import streamlit as st
import pandas as pd

st.write("""
# Stock Price Analysis

Comparison of the stock **closing_price** and **volume_price** of [Tesla, Inc](https://www.tesla.com/).
        
""")

# Define the ticker symbols; GOOGL for Google, AMZN for Amazon
tickerSymbol='TSLA'

#Get data on this ticker
tickerData = yf.Ticker(tickerSymbol)

#Get the historical prices for this ticker
tickerDf=tickerData.history(period='id', start='2011-01-01', end='2021-01-15')

# Open High Low Close Volume Dividends Stock Splits
st.write("""
### Closing Price
""")
st.line_chart(tickerDf.Close)
st.write("""
### Volume Price
""")
st.line_chart(tickerDf.Volume)