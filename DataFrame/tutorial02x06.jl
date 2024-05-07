brand = ["Company A", "Company A", "Company A"]
tier = ["Premium", "Economy", "Standard"]
quantity = [10, 100, 50]
price = [100, 10, 50]
cost = [30, 7, 25]

my_matrix = [brand tier quantity price cost]

my_price = my_matrix[:, 4]

my_economy = my_matrix[2, :]