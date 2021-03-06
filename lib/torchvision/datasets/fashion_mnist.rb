module TorchVision
  module Datasets
    class FashionMNIST < MNIST
      # https://github.com/zalandoresearch/fashion-mnist

      private

      def mirrors
        [
          "http://fashion-mnist.s3-website.eu-central-1.amazonaws.com/"
        ]
      end

      def resources
        [
          {
            filename: "train-images-idx3-ubyte.gz",
            sha256: "3aede38d61863908ad78613f6a32ed271626dd12800ba2636569512369268a84"
          },
          {
            filename: "train-labels-idx1-ubyte.gz",
            sha256: "a04f17134ac03560a47e3764e11b92fc97de4d1bfaf8ba1a3aa29af54cc90845"
          },
          {
            filename: "t10k-images-idx3-ubyte.gz",
            sha256: "346e55b948d973a97e58d2351dde16a484bd415d4595297633bb08f03db6a073"
          },
          {
            filename: "t10k-labels-idx1-ubyte.gz",
            sha256: "67da17c76eaffca5446c3361aaab5c3cd6d1c2608764d35dfb1850b086bf8dd5"
          }
        ]
      end
    end
  end
end
