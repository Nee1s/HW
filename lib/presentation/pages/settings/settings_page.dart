import 'package:flutter/material.dart';
import 'package:hw/bloc/root_bloc/bloc.dart';
import 'package:hw/bloc/settings_bloc/settings_bloc.dart';
import 'package:hw/bloc/settings_bloc/settings_bloc_event.dart';
import 'package:hw/bloc/settings_bloc/settings_bloc_state.dart';
import 'package:hw/components/common_widgets/widgets.dart';
import 'package:hw/constants/constants.dart' as consts;

class SettingsPage extends StatefulWidget {
  static final GlobalKey<State<StatefulWidget>> globalKey = GlobalKey();
  static const path = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void didChangeDependencies() {
    context
        .read<SettingsBloc>()
        .add(const LoadSettingEvent(nameSetting: consts.localeSettingPref));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;

    const double factorCommonPadding = 0.02;
    final double paddingCommon = heightScreen * factorCommonPadding;

    return SafeArea(
      child: Scaffold(
        appBar: const CommonAppBar(title: consts.RecipeLocal.titleApp),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(consts.scaffoldBackgrnd), fit: BoxFit.fill),
          ),
          foregroundDecoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(consts.gridBackgrnd), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.all(paddingCommon),
            child: Column(
              children: const [
                Expanded(child: SwitchLocalePanel()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SwitchLocalePanel extends StatefulWidget {
  const SwitchLocalePanel({Key? key}) : super(key: key);

  @override
  State<SwitchLocalePanel> createState() => _SwitchLocalePanelState();
}

class _SwitchLocalePanelState extends State<SwitchLocalePanel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return SwitchListTile(
          title: state.locale == 'en-EN'
              ? const Text('English')
              : const Text('Русский'),
          onChanged: (bool value) => context.read<SettingsBloc>().add(
              SaveSettingEvent(
                  settingName: consts.localeSettingPref,
                  setting: value ? 'en-EN' : 'ru-RU')),
          value: state.locale == 'en-EN',
          activeColor: Colors.grey,
          inactiveThumbColor: Colors.grey,
        );
      },
    );
  }
}
