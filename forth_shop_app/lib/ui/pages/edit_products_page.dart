import 'package:flutter/material.dart';
import 'package:forth_shop_app/providers/product.dart';
import 'package:provider/provider.dart';
import '../../routers/route.dart';
import '../../providers/product_provider.dart';

class EditProductsPage extends StatefulWidget {
  @override
  _EditProductsPageState createState() => _EditProductsPageState();
}

class _EditProductsPageState extends State<EditProductsPage> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _edittedProduct = Product(
    id: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );
  var _isInit = true;
  var _isLoading = false;
  var _initValue = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };

  void _updateImageURL() {
    var urlPattern = Router.urlPattern;
    var result = new RegExp(urlPattern, caseSensitive: false)
        .hasMatch(_imageUrlController.text);
    // print(result);
    if (!_imageUrlFocusNode.hasFocus) {
      if (result) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageURL);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _edittedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValue = {
          'title': _edittedProduct.title,
          'description': _edittedProduct.description,
          'imageUrl': '',
          'price': _edittedProduct.price.toString()
        };
        _imageUrlController.text = _edittedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageURL);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isVaild = _form.currentState.validate();
    if (!isVaild) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    if (_edittedProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_edittedProduct.id, _edittedProduct);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_edittedProduct);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occured'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                        initialValue: _initValue['title'],
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        validator: (value) =>
                            value.isEmpty ? 'You must input Title' : null,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) => FocusScope.of(context)
                            .requestFocus(_priceFocusNode),
                        onSaved: (value) {
                          _edittedProduct = Product(
                            title: value,
                            price: _edittedProduct.price,
                            imageUrl: _edittedProduct.imageUrl,
                            description: _edittedProduct.description,
                            id: _edittedProduct.id,
                            isFavorite: _edittedProduct.isFavorite,
                          );
                        }),
                    TextFormField(
                      initialValue: _initValue['price'],
                      decoration: InputDecoration(
                        labelText: '가격',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      validator: (value) {
                        if (double.tryParse(value) == null) {
                          return 'You must input number';
                        } else if (double.parse(value) <= 0) {
                          return 'You must input greater than 0';
                        } else if (value.isEmpty) {
                          return 'Please enter a price.';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(_descriptionFocusNode),
                      onSaved: (value) => _edittedProduct = Product(
                        title: _edittedProduct.title,
                        price: double.parse(value),
                        imageUrl: _edittedProduct.imageUrl,
                        description: _edittedProduct.description,
                        id: _edittedProduct.id,
                        isFavorite: _edittedProduct.isFavorite,
                      ),
                    ),
                    TextFormField(
                      initialValue: _initValue['description'],
                      decoration: InputDecoration(
                        labelText: '설명',
                      ),
                      textInputAction: TextInputAction.next,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      validator: (inputValue) {
                        if (inputValue.isEmpty) {
                          return 'Please input description';
                        } else if (inputValue.length < 10) {
                          return '10자 이상 입력해주세요.';
                        }
                        return null;
                      },
                      focusNode: _descriptionFocusNode,
                      onSaved: (value) {
                        _edittedProduct = Product(
                          title: _edittedProduct.title,
                          price: _edittedProduct.price,
                          imageUrl: _edittedProduct.imageUrl,
                          description: value,
                          id: _edittedProduct.id,
                          isFavorite: _edittedProduct.isFavorite,
                        );
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 8, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Container(
                            child: _imageUrlController.text.isEmpty
                                ? Text('Enter a URL')
                                : FittedBox(
                                    child: Image.network(
                                      _imageUrlController.text,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageUrlFocusNode,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) => _saveForm(),
                            onSaved: (value) => _edittedProduct = Product(
                              title: _edittedProduct.title,
                              price: _edittedProduct.price,
                              imageUrl: value,
                              description: _edittedProduct.description,
                              id: _edittedProduct.id,
                              isFavorite: _edittedProduct.isFavorite,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
