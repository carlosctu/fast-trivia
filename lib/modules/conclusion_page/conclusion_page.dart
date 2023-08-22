import 'package:flutter/material.dart';

import 'package:fast_trivia/modules/home_page/home_page.dart';
import 'package:fast_trivia/utils/ui/export_widgets.dart';

class ConclusionArguments {
  final double score;
  ConclusionArguments({
    required this.score,
  });
}

class ConclusionPage extends StatelessWidget {
  final ConclusionArguments args;
  const ConclusionPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  static const route = "/conclusion";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 24,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/gif/confetti.gif",
                      height: 84,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Questionario enviado com sucesso!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Pontuação: ${args.score.toStringAsFixed(1)}%",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const _ConclusionButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ConclusionButtons extends StatelessWidget {
  const _ConclusionButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonContainer(
          onPressed: () {},
          isButtonColored: true,
          label: Text("Revisar respostas"),
        ),
        ButtonContainer(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.route,
            (route) => false,
          ),
          isButtonColored: true,
          label: Text("Voltar para questionarios"),
        ),
      ],
    );
  }
}
