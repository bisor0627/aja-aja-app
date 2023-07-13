import 'package:ajaaja_app/index.dart';

class PrivacyScreen extends ConsumerStatefulWidget {
  const PrivacyScreen({super.key});

  @override
  ConsumerState<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends ConsumerState<PrivacyScreen> {
  double bottomSheetHeight = 0.0;
  bool isBottom = false;
  final bottomSheetKey = GlobalKey();
  final _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels != 0) {
          setState(() {
            isBottom = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sheetHeight = bottomSheetKey.currentContext?.size?.height ?? 0;
      if (sheetHeight != bottomSheetHeight) {
        setState(() {
          bottomSheetHeight = sheetHeight;
        });
      }
      if (_controller.position.maxScrollExtent < 1.0) {
        setState(() {
          isBottom = true;
        });
      }
    });
    return Scaffold(
      appBar: AppBar(
          title: const Text('개인정보처리방침'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body: SingleChildScrollView(
        controller: _controller,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: '1. 개인정보의 수집 및 이용\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(
                    text:
                        '"아자아자"는 서비스 제공을 위해 필요한 최소한의 개인정보를 수집하고 이용합니다. 수집하는 개인정보는 회원가입, 서비스 이용 중 필요한 정보 등을 포함합니다...\n\n'),
                TextSpan(
                    text: '2. 개인정보의 보호 및 관리\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(
                    text: '회원의 개인정보는 비밀번호 등의 방법으로 안전하게 보호하고 있습니다. 개인정보의 열람, 수정은 본인만 가능하며, 이는 비밀번호를 통해 가능합니다...\n\n'),
                TextSpan(
                    text: '3. 개인정보의 제3자 제공\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(text: '"아자아자"는 회원의 개인정보를 제3자에게 제공하지 않습니다. 단, 법적인 사유가 발생하거나 회원이 동의한 경우에는 예외로 합니다...\n\n'),
                TextSpan(
                    text: '4. 개인정보의 파기\n', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(
                    text:
                        '회원의 개인정보는 회원 탈퇴 시점 혹은 개인정보의 수집 및 이용목적이 달성되었을 때 파기합니다. 파기는 즉시 이루어지며, 파기된 정보는 어떠한 방법으로도 복구할 수 없습니다...\n\n'),
                TextSpan(
                    text: '10. 개인정보 관련 문의\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(text: '개인정보 보호 및 사용에 대한 문의는 "아자아자" 고객센터로 문의하실 수 있습니다...\n\n'),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: ElevatedButton(
          key: bottomSheetKey,
          style: const ButtonStyle().infinity,
          onPressed: isBottom ? () => GoRouter.of(context).pop(true) : null,
          child: const Text('동의합니다')),
    );
  }
}
