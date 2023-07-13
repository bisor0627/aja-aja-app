import 'package:ajaaja_app/index.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
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
      if (_controller.position.maxScrollExtent == 1.0) {
        setState(() {
          isBottom = true;
        });
      }
    });
    return Scaffold(
      appBar: AppBar(
          title: const Text('이용약관'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          )),
      body: SingleChildScrollView(
        controller: _controller,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, bottomSheetHeight),
          child: RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: '1. 서비스 이용에 관한 조항\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(
                    text:
                        '"아자아자" 앱은 자아성장을 목표로 합니다. 서비스를 이용하기 위해서는 해당 약관에 동의해야 합니다. 서비스의 이용은 회원 가입 시점에서 시작되며, 서비스 이용은 회원 탈퇴 혹은 강제 탈퇴될 때까지 지속됩니다. 서비스 이용 중 발생하는 모든 데이터 사용은 회원의 책임입니다...\n\n'),
                TextSpan(
                    text: '2. 개인정보 보호에 관한 조항\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(
                    text:
                        '회원의 개인정보는 중요한 정보이며, 이를 보호하는 것은 "아자아자"의 주요 목표 중 하나입니다. 회원정보는 서비스 제공을 위한 목적 이외에는 사용되지 않습니다. 회원 정보의 안전성을 보장하기 위해 비밀번호 등의 정보는 암호화하여 저장합니다. 회원은 개인정보를 최신의 상태로 유지해야 하며, 모든 회원 정보에 대한 책임은 회원에게 있습니다...\n\n'),
                TextSpan(
                    text: '3. 콘텐츠 이용에 관한 조항\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(
                    text:
                        '"아자아자"에서 제공하는 콘텐츠는 회원의 자아성장을 지원하기 위한 것입니다. 이 콘텐츠의 무단 복제나 배포는 금지되어 있습니다. 콘텐츠의 저작권은 "아자아자"에 있으며, 회원은 이를 허락 없이 사용할 수 없습니다. "아자아자"는 회원이 서비스를 이용함에 있어서 발생하는 데이터 비용에 대해 책임을 지지 않습니다...\n\n'),
                TextSpan(
                    text: '4. 멤버십 및 결제에 관한 조항\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(
                    text:
                        '"아자아자"에서는 프리미엄 멤버십을 통해 추가적인 자료와 서비스를 제공합니다. 멤버십은 월간 또는 연간으로 결제될 수 있으며, 환불은 이용 약관에 따라 다를 수 있습니다. 프리미엄 멤버십은 자동으로 갱신되며, 회원이 직접 멤버십을 취소하지 않는 한 갱신되는 것을 동의한 것으로 간주합니다...\n\n'),
                TextSpan(text: '10. 기타\n', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(text: '..."아자아자" 앱 이용과 관련하여 본 약관에 명시되지 않은 사항과 이 약관의 해석에 대해서는 관련 법령 또는 상관례에 따릅니다...\n\n'),
                TextSpan(text: '10. 기타\n', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(text: '..."아자아자" 앱 이용과 관련하여 본 약관에 명시되지 않은 사항과 이 약관의 해석에 대해서는 관련 법령 또는 상관례에 따릅니다...\n\n'),
                TextSpan(text: '10. 기타\n', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(text: '..."아자아자" 앱 이용과 관련하여 본 약관에 명시되지 않은 사항과 이 약관의 해석에 대해서는 관련 법령 또는 상관례에 따릅니다...\n\n'),
                TextSpan(text: '10. 기타\n', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(text: '..."아자아자" 앱 이용과 관련하여 본 약관에 명시되지 않은 사항과 이 약관의 해석에 대해서는 관련 법령 또는 상관례에 따릅니다...\n\n'),
                TextSpan(text: '10. 기타\n', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                TextSpan(text: '..."아자아자" 앱 이용과 관련하여 본 약관에 명시되지 않은 사항과 이 약관의 해석에 대해서는 관련 법령 또는 상관례에 따릅니다...\n\n'),
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
