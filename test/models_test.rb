require_relative "test_helper"

class ModelsTest < Minitest::Test
  def test_alexnet
    net = TorchVision::Models::AlexNet.new
    assert_equal 24, net.modules.size
    # assert_equal 16, net.parameters.size
  end

  def test_resnet18
    Torch.manual_seed(1)

    transform = TorchVision::Transforms::Compose.new([
      TorchVision::Transforms::ToTensor.new,
      TorchVision::Transforms::Normalize.new([0.5, 0.5, 0.5], [0.5, 0.5, 0.5])
    ])
    trainset = TorchVision::Datasets::CIFAR10.new(root, train: true, download: true, transform: transform)
    trainloader = Torch::Utils::Data::DataLoader.new(trainset, batch_size: 4)

    net = TorchVision::Models::ResNet18.new
    assert_equal 68, net.modules.size
    assert net.named_modules.keys.include?("layer2.0.downsample.0")
    trainloader.each do |data, target|
      net.call(data)
      break
    end
  end

  def test_vgg11
    net = TorchVision::Models::VGG11.new
    assert_equal 32, net.modules.size
    # assert_equal 22, net.parameters.size
  end

  def test_vgg13
    net = TorchVision::Models::VGG13.new
    assert_equal 36, net.modules.size
    # assert_equal 26, net.parameters.size
  end

  def test_vgg16
    net = TorchVision::Models::VGG16.new
    assert_equal 42, net.modules.size
    # assert_equal 32, net.parameters.size
  end

  def test_vgg19
    net = TorchVision::Models::VGG19.new
    assert_equal 48, net.modules.size
    # assert_equal 38, net.parameters.size
  end
end
