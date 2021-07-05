import numpy as np
import matplotlib.pyplot as plt


def get_dataset(file_path):
    train_data, test_data = np.split(np.loadtxt(file_path), [400])
    train_set = dict(
        x=train_data[:, :8],
        y=train_data[:, 8].astype(np.int) - 1,
        size=train_data.shape[0]
    )
    test_set = dict(
        x=test_data[:, :8],
        y=test_data[:, 8].astype(np.int) - 1,
        size=test_data.shape[0]
    )
    return train_set, test_set


def softmax(x):
    expx = np.exp(x - x.max(axis=1).reshape(-1, 1))
    result = expx / expx.sum(axis=1).reshape(-1, 1)
    return result


l
    lr = init_lr
    # if epoch < max_epoch * 0.3:
    #     lr = init_lr
    # elif epoch < max_epoch * 0.6:
    #     lr = init_lr * 0.1
    # else:
    #     lr = init_lr * 0.01
    return lr


def main():
    epoch = 200000
    init_lr = 0.01
    hidden_width = 128

    plot = dict(
        time=[],
        test=[],
        train=[]
    )
    train_set, test_set = get_dataset('dataset.txt')

    w1 = np.random.randn(8, hidden_width)
    b1 = np.zeros(hidden_width)
    w2 = np.random.randn(hidden_width, 4)
    b2 = np.zeros(4)

    for t in range(epoch):
        print('===> Epoch %d/%d' % (t + 1, epoch))
        lr = lr_decay(init_lr, t, epoch)
        # forward
        a1 = train_set['x'] @ w1 + b1
        a1 = np.maximum(a1, 0)
        a2 = a1 @ w2 + b2
        pred_y = np.argmax(a2, axis=1)
        train_acc = (train_set['y'] == pred_y).sum() / train_set['size']
        print('Train Accuracy: %.4f' % train_acc)
        # backward
        p = softmax(a2)
        log_likelihood = - np.log(p[range(train_set['size']), train_set['y']])
        loss = np.sum(log_likelihood) / train_set['size']
        print('Train Loss:     %.4f' % loss)

        d_loss = a2
        d_loss[range(train_set['size']), train_set['y']] -= 1
        d_loss /= train_set['size']
        d_w2 = a1.T @ d_loss
        d_b2 = np.sum(d_loss, axis=0)

        d_a1 = d_loss @ w2.T
        d_a1 = d_a1 * (a1 > 0)
        d_w1 = train_set['x'].T @ d_a1
        d_b1 = np.sum(d_a1, axis=0)
        # evaluate
        a1 = test_set['x'] @ w1 + b1
        a1 = np.maximum(a1, 0)
        a2 = a1 @ w2 + b2
        pred_y = np.argmax(a2, axis=1)
        test_acc = (test_set['y'] == pred_y).sum() / test_set['size']
        print('Test Accuracy:  %.4f' % test_acc)
        w1 -= lr * d_w1
        b1 -= lr * d_b1
        w2 -= lr * d_w2
        b2 -= lr * d_b2
        # plot
        plot['time'].append(t)
        plot['train'].append(train_acc)
        plot['test'].append(test_acc)
    plt.plot(plot['time'], plot['train'], label='Train')
    plt.plot(plot['time'], plot['test'], label='Test')
    plt.ylim(0, 1)
    plt.legend()
    plt.xlabel('Epoch')
    plt.ylabel('Accuracy')
    plt.title('HW3 (lr=%e, H=%d' % (lr, hidden_width))
    plt.show()


if __name__ == '__main__':
    main()
