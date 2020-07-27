from sklearn.neural_network import MLPClassifier
from sklearn.model_selection import train_test_split
from sklearn.datasets import fetch_openml
from matplotlib import pyplot as plt


X, y = fetch_openml('mnist_784', version=1, return_X_y=True)
X_train, X_test, y_train, y_test = train_test_split(X, y)
mlp = MLPClassifier(hidden_layer_sizes=(100, 100, 100))
mlp.fit(X_train, y_train)
y_pred = mlp.predict(X_test)
X_bad = X_test[y_pred != y_test]
y_bad = y_pred[y_pred != y_test]
y_true_bad = y_test[y_pred != y_test]

for i in range(len(y_bad)):
    plt.matshow(X_bad[i].reshape(28, 28), cmap=plt.cm.gray)
    plt.xticks(())
    plt.yticks(())
    plt.title(y_bad[i] + " " + y_true_bad[i])
    plt.show()
