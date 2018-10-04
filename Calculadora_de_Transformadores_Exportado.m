classdef Calculadora_de_Transformadores_Exportado < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        Calculadora                 matlab.ui.Figure
        Menu                        matlab.ui.container.Menu
        SalirMenu                   matlab.ui.container.Menu
        AcercadeMenu                matlab.ui.container.Menu
        AyudaMenu                   matlab.ui.container.Menu
        Button                      matlab.ui.control.Button
        voltaje                     matlab.ui.control.NumericEditField
        amperaje                    matlab.ui.control.NumericEditField
        m1x                         matlab.ui.control.NumericEditField
        m4x                         matlab.ui.control.NumericEditField
        m3x                         matlab.ui.control.NumericEditField
        mp                          matlab.ui.control.NumericEditField
        m4z                         matlab.ui.control.NumericEditField
        m3z                         matlab.ui.control.NumericEditField
        m2z                         matlab.ui.control.NumericEditField
        mu                          matlab.ui.control.NumericEditField
        vueltas                     matlab.ui.control.NumericEditField
        R1EditFieldLabel            matlab.ui.control.Label
        R1Text                      matlab.ui.control.NumericEditField
        R2EditFieldLabel            matlab.ui.control.Label
        R2Text                      matlab.ui.control.NumericEditField
        R3EditFieldLabel            matlab.ui.control.Label
        R3Text                      matlab.ui.control.NumericEditField
        R4EditFieldLabel            matlab.ui.control.Label
        R4Text                      matlab.ui.control.NumericEditField
        RTEditFieldLabel            matlab.ui.control.Label
        RTText                      matlab.ui.control.NumericEditField
        R1AVWbLabel                 matlab.ui.control.Label
        R2AVWbLabel                 matlab.ui.control.Label
        R3AVWbLabel                 matlab.ui.control.Label
        R4AVWbLabel                 matlab.ui.control.Label
        R5AVWbLabel                 matlab.ui.control.Label
        FlujoElectromagneticoLabel  matlab.ui.control.Label
        FlujoText                   matlab.ui.control.NumericEditField
        WbLabel                     matlab.ui.control.Label
        UEditFieldLabel             matlab.ui.control.Label
        UText                       matlab.ui.control.NumericEditField
        HEditFieldLabel             matlab.ui.control.Label
        HText                       matlab.ui.control.NumericEditField
        LensLabel                   matlab.ui.control.Label
        HmLabel                     matlab.ui.control.Label
        BEditFieldLabel             matlab.ui.control.Label
        BText                       matlab.ui.control.NumericEditField
        CalculadoradeTransformadoresLabel  matlab.ui.control.Label
        AyudaPanel                  matlab.ui.container.Panel
        OKButton                    matlab.ui.control.Button
        Label                       matlab.ui.control.Label
        ALabel                      matlab.ui.control.Label
        cmLabel                     matlab.ui.control.Label
        cmLabel_2                   matlab.ui.control.Label
        cmLabel_3                   matlab.ui.control.Label
        cmLabel_4                   matlab.ui.control.Label
        cmLabel_5                   matlab.ui.control.Label
        cmLabel_6                   matlab.ui.control.Label
        cmLabel_7                   matlab.ui.control.Label
        VueltasLabel                matlab.ui.control.Label
        VoltajeEditFieldLabel       matlab.ui.control.Label
        Resultado_Voltaje           matlab.ui.control.NumericEditField
        VCALabel                    matlab.ui.control.Label
        TeslasLabel                 matlab.ui.control.Label
        VoltiosLabel                matlab.ui.control.Label
    end

    
    properties (Access = private)
        M0=( (4*pi)*10^-7 ) % Constante
    end
    
    methods (Access = private)
        
        function calcR(app)  %Funcion para Calcular todas las resistencias del transformador
            app.R1Text.Value = ((app.m3z.Value+(app.m2z.Value/2)+(app.m4z.Value/2))/100)/ ((app.mu.Value) * app.M0 * ((app.m1x.Value * app.mp.Value)/10000));
            app.R2Text.Value = ((app.m4x.Value+(app.m1x.Value/2)+(app.m3x.Value/2))/100)/ ((app.mu.Value) * app.M0 * ((app.m2z.Value * app.mp.Value)/10000));
            app.R3Text.Value = ((app.m3z.Value+(app.m2z.Value/2)+(app.m4z.Value/2))/100)/ ((app.mu.Value) * app.M0 * ((app.m3x.Value * app.mp.Value)/10000));
            app.R4Text.Value = ((app.m4x.Value+(app.m1x.Value/2)+(app.m3x.Value/2))/100)/ ((app.mu.Value) * app.M0 * ((app.m4z.Value * app.mp.Value)/10000));
            app.RTText.Value = app.R1Text.Value + app.R2Text.Value + app.R3Text.Value + app.R4Text.Value;
        end
        
        function flujo(app) %Funcion para el calculo del flujo electromagnetico
            app.FlujoText.Value = ((app.vueltas.Value)*(app.amperaje.Value))/(app.RTText.Value);
            
        end
        
        function U(app) 
            app.UText.Value = (app.mu.Value)*(app.M0);
        end
        
        function H(app)
            app.HText.Value = ((app.vueltas.Value)*(app.amperaje.Value))/((app.m1x.Value+(app.m4x.Value * 2)+app.m3x.Value+app.m4z.Value+(app.m3z.Value * 2)+ app.m2z.Value)/100);
        end
        
        function B(app)
            app.BText.Value = (app.UText.Value * app.HText.Value);
        end
        
        function CalcAll(app) %Funcion para calcular todo
            calcR(app);
            flujo(app);
            U(app);
            H(app);
            B(app);
            app.Resultado_Voltaje.Value = app.voltaje.Value;
        end
    
    end

    methods (Access = private)

        % Value changed function: mu
        function muValueChanged(app, event)
            CalcAll(app);
        end

        % Value changed function: m1x
        function m1xValueChanged(app, event)
            CalcAll(app);
        end

        % Value changed function: m4x
        function m4xValueChanged(app, event)
            CalcAll(app);
        end

        % Value changed function: m3x
        function m3xValueChanged(app, event)
            CalcAll(app);
        end

        % Value changed function: mp
        function mpValueChanged(app, event)
            CalcAll(app);
        end

        % Value changed function: m4z
        function m4zValueChanged(app, event)
            CalcAll(app);
        end

        % Value changed function: m3z
        function m3zValueChanged(app, event)
            CalcAll(app);
        end

        % Value changed function: m2z
        function m2zValueChanged(app, event)
            CalcAll(app);
        end

        % Value changed function: amperaje
        function amperajeValueChanged(app, event)
            CalcAll(app);
        end

        % Value changed function: vueltas
        function vueltasValueChanged(app, event)
            CalcAll(app);
        end

        % Menu selected function: SalirMenu
        function SalirMenuSelected(app, event)
           delete(app);
        end

        % Menu selected function: AyudaMenu
        function AyudaMenuSelected(app, event)
            app.AyudaPanel.Visible = true;
            app.ALabel.Visible = false;
            app.VueltasLabel.Visible = false;
            app.cmLabel_2.Visible = false;
            app.VCALabel.Visible = false;
        end

        % Button pushed function: OKButton
        function OKButtonPushed(app, event)
            app.AyudaPanel.Visible = false;
            app.ALabel.Visible = true;
            app.VueltasLabel.Visible = true;
            app.cmLabel_2.Visible = true;
            app.VCALabel.Visible = true;
        end

        % Value changed function: voltaje
        function voltajeValueChanged(app, event)
            CalcAll(app);
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create Calculadora
            app.Calculadora = uifigure;
            app.Calculadora.AutoResizeChildren = 'off';
            app.Calculadora.Position = [100 100 616 480];
            app.Calculadora.Name = 'Calculadora';
            app.Calculadora.Resize = 'off';

            % Create Menu
            app.Menu = uimenu(app.Calculadora);
            app.Menu.Text = 'Menu';

            % Create SalirMenu
            app.SalirMenu = uimenu(app.Menu);
            app.SalirMenu.MenuSelectedFcn = createCallbackFcn(app, @SalirMenuSelected, true);
            app.SalirMenu.Text = 'Salir';

            % Create AcercadeMenu
            app.AcercadeMenu = uimenu(app.Calculadora);
            app.AcercadeMenu.Text = 'Acerca de';

            % Create AyudaMenu
            app.AyudaMenu = uimenu(app.AcercadeMenu);
            app.AyudaMenu.MenuSelectedFcn = createCallbackFcn(app, @AyudaMenuSelected, true);
            app.AyudaMenu.Text = 'Ayuda';

            % Create Button
            app.Button = uibutton(app.Calculadora, 'push');
            app.Button.Icon = 'Transformador.jpg';
            app.Button.Position = [56 157 500 280];
            app.Button.Text = '';

            % Create voltaje
            app.voltaje = uieditfield(app.Calculadora, 'numeric');
            app.voltaje.Limits = [0 Inf];
            app.voltaje.ValueChangedFcn = createCallbackFcn(app, @voltajeValueChanged, true);
            app.voltaje.Position = [140 257 40 32];

            % Create amperaje
            app.amperaje = uieditfield(app.Calculadora, 'numeric');
            app.amperaje.Limits = [0 Inf];
            app.amperaje.ValueChangedFcn = createCallbackFcn(app, @amperajeValueChanged, true);
            app.amperaje.Position = [162 367 37 22];

            % Create m1x
            app.m1x = uieditfield(app.Calculadora, 'numeric');
            app.m1x.Limits = [0.001 Inf];
            app.m1x.ValueChangedFcn = createCallbackFcn(app, @m1xValueChanged, true);
            app.m1x.Position = [220 166 40 22];
            app.m1x.Value = 0.001;

            % Create m4x
            app.m4x = uieditfield(app.Calculadora, 'numeric');
            app.m4x.Limits = [0.001 Inf];
            app.m4x.ValueChangedFcn = createCallbackFcn(app, @m4xValueChanged, true);
            app.m4x.Position = [270 186 40 22];
            app.m4x.Value = 0.001;

            % Create m3x
            app.m3x = uieditfield(app.Calculadora, 'numeric');
            app.m3x.Limits = [0.001 Inf];
            app.m3x.ValueChangedFcn = createCallbackFcn(app, @m3xValueChanged, true);
            app.m3x.Position = [330 167 40 22];
            app.m3x.Value = 0.001;

            % Create mp
            app.mp = uieditfield(app.Calculadora, 'numeric');
            app.mp.Limits = [0.001 Inf];
            app.mp.ValueChangedFcn = createCallbackFcn(app, @mpValueChanged, true);
            app.mp.Position = [450 187 40 22];
            app.mp.Value = 0.001;

            % Create m4z
            app.m4z = uieditfield(app.Calculadora, 'numeric');
            app.m4z.Limits = [0.001 Inf];
            app.m4z.ValueChangedFcn = createCallbackFcn(app, @m4zValueChanged, true);
            app.m4z.Position = [460 257 40 22];
            app.m4z.Value = 0.001;

            % Create m3z
            app.m3z = uieditfield(app.Calculadora, 'numeric');
            app.m3z.Limits = [0.001 Inf];
            app.m3z.ValueChangedFcn = createCallbackFcn(app, @m3zValueChanged, true);
            app.m3z.Position = [430 307 40 22];
            app.m3z.Value = 0.001;

            % Create m2z
            app.m2z = uieditfield(app.Calculadora, 'numeric');
            app.m2z.Limits = [0.001 Inf];
            app.m2z.ValueChangedFcn = createCallbackFcn(app, @m2zValueChanged, true);
            app.m2z.Position = [450 357 40 22];
            app.m2z.Value = 0.001;

            % Create mu
            app.mu = uieditfield(app.Calculadora, 'numeric');
            app.mu.Limits = [0 Inf];
            app.mu.ValueChangedFcn = createCallbackFcn(app, @muValueChanged, true);
            app.mu.Position = [150 407 40 22];

            % Create vueltas
            app.vueltas = uieditfield(app.Calculadora, 'numeric');
            app.vueltas.Limits = [1 Inf];
            app.vueltas.ValueChangedFcn = createCallbackFcn(app, @vueltasValueChanged, true);
            app.vueltas.Position = [290 327 40 22];
            app.vueltas.Value = 1;

            % Create R1EditFieldLabel
            app.R1EditFieldLabel = uilabel(app.Calculadora);
            app.R1EditFieldLabel.HorizontalAlignment = 'right';
            app.R1EditFieldLabel.Position = [20 90 25 22];
            app.R1EditFieldLabel.Text = 'R1';

            % Create R1Text
            app.R1Text = uieditfield(app.Calculadora, 'numeric');
            app.R1Text.Editable = 'off';
            app.R1Text.Position = [50 90 80 22];

            % Create R2EditFieldLabel
            app.R2EditFieldLabel = uilabel(app.Calculadora);
            app.R2EditFieldLabel.HorizontalAlignment = 'right';
            app.R2EditFieldLabel.Position = [20 70 25 22];
            app.R2EditFieldLabel.Text = 'R2';

            % Create R2Text
            app.R2Text = uieditfield(app.Calculadora, 'numeric');
            app.R2Text.Editable = 'off';
            app.R2Text.Position = [50 70 80 22];

            % Create R3EditFieldLabel
            app.R3EditFieldLabel = uilabel(app.Calculadora);
            app.R3EditFieldLabel.HorizontalAlignment = 'right';
            app.R3EditFieldLabel.Position = [20 50 25 22];
            app.R3EditFieldLabel.Text = 'R3';

            % Create R3Text
            app.R3Text = uieditfield(app.Calculadora, 'numeric');
            app.R3Text.Editable = 'off';
            app.R3Text.Position = [50 50 80 22];

            % Create R4EditFieldLabel
            app.R4EditFieldLabel = uilabel(app.Calculadora);
            app.R4EditFieldLabel.HorizontalAlignment = 'right';
            app.R4EditFieldLabel.Position = [20 30 25 22];
            app.R4EditFieldLabel.Text = 'R4';

            % Create R4Text
            app.R4Text = uieditfield(app.Calculadora, 'numeric');
            app.R4Text.Editable = 'off';
            app.R4Text.Position = [50 30 80 22];

            % Create RTEditFieldLabel
            app.RTEditFieldLabel = uilabel(app.Calculadora);
            app.RTEditFieldLabel.HorizontalAlignment = 'right';
            app.RTEditFieldLabel.Position = [20 10 25 22];
            app.RTEditFieldLabel.Text = 'RT';

            % Create RTText
            app.RTText = uieditfield(app.Calculadora, 'numeric');
            app.RTText.Editable = 'off';
            app.RTText.Position = [50 10 90 22];

            % Create R1AVWbLabel
            app.R1AVWbLabel = uilabel(app.Calculadora);
            app.R1AVWbLabel.Position = [130 90 42 22];
            app.R1AVWbLabel.Text = 'AV/Wb';

            % Create R2AVWbLabel
            app.R2AVWbLabel = uilabel(app.Calculadora);
            app.R2AVWbLabel.Position = [130 70 42 22];
            app.R2AVWbLabel.Text = 'AV/Wb';

            % Create R3AVWbLabel
            app.R3AVWbLabel = uilabel(app.Calculadora);
            app.R3AVWbLabel.Position = [130 50 42 22];
            app.R3AVWbLabel.Text = 'AV/Wb';

            % Create R4AVWbLabel
            app.R4AVWbLabel = uilabel(app.Calculadora);
            app.R4AVWbLabel.Position = [130 30 42 22];
            app.R4AVWbLabel.Text = 'AV/Wb';

            % Create R5AVWbLabel
            app.R5AVWbLabel = uilabel(app.Calculadora);
            app.R5AVWbLabel.Position = [140 10 42 22];
            app.R5AVWbLabel.Text = 'AV/Wb';

            % Create FlujoElectromagneticoLabel
            app.FlujoElectromagneticoLabel = uilabel(app.Calculadora);
            app.FlujoElectromagneticoLabel.HorizontalAlignment = 'right';
            app.FlujoElectromagneticoLabel.Position = [191 84 98 28];
            app.FlujoElectromagneticoLabel.Text = {'Flujo'; 'Electromagnetico'};

            % Create FlujoText
            app.FlujoText = uieditfield(app.Calculadora, 'numeric');
            app.FlujoText.Editable = 'off';
            app.FlujoText.Position = [294 90 60 22];

            % Create WbLabel
            app.WbLabel = uilabel(app.Calculadora);
            app.WbLabel.Position = [354 90 25 22];
            app.WbLabel.Text = 'Wb';

            % Create UEditFieldLabel
            app.UEditFieldLabel = uilabel(app.Calculadora);
            app.UEditFieldLabel.HorizontalAlignment = 'right';
            app.UEditFieldLabel.Position = [267 51 10 22];
            app.UEditFieldLabel.Text = 'U';

            % Create UText
            app.UText = uieditfield(app.Calculadora, 'numeric');
            app.UText.Editable = 'off';
            app.UText.Position = [282 51 70 22];

            % Create HEditFieldLabel
            app.HEditFieldLabel = uilabel(app.Calculadora);
            app.HEditFieldLabel.HorizontalAlignment = 'right';
            app.HEditFieldLabel.Position = [403 87 10 22];
            app.HEditFieldLabel.Text = 'H';

            % Create HText
            app.HText = uieditfield(app.Calculadora, 'numeric');
            app.HText.Editable = 'off';
            app.HText.Position = [423 87 80 22];

            % Create LensLabel
            app.LensLabel = uilabel(app.Calculadora);
            app.LensLabel.Position = [503 87 32 22];
            app.LensLabel.Text = 'Lens';

            % Create HmLabel
            app.HmLabel = uilabel(app.Calculadora);
            app.HmLabel.Position = [352 51 27 22];
            app.HmLabel.Text = 'H/m';

            % Create BEditFieldLabel
            app.BEditFieldLabel = uilabel(app.Calculadora);
            app.BEditFieldLabel.HorizontalAlignment = 'right';
            app.BEditFieldLabel.Position = [405 51 15 22];
            app.BEditFieldLabel.Text = 'B';

            % Create BText
            app.BText = uieditfield(app.Calculadora, 'numeric');
            app.BText.Editable = 'off';
            app.BText.Position = [425 51 70 22];

            % Create CalculadoradeTransformadoresLabel
            app.CalculadoradeTransformadoresLabel = uilabel(app.Calculadora);
            app.CalculadoradeTransformadoresLabel.FontSize = 20;
            app.CalculadoradeTransformadoresLabel.Position = [158 447 301 24];
            app.CalculadoradeTransformadoresLabel.Text = 'Calculadora de Transformadores';

            % Create AyudaPanel
            app.AyudaPanel = uipanel(app.Calculadora);
            app.AyudaPanel.AutoResizeChildren = 'off';
            app.AyudaPanel.Title = 'Ayuda';
            app.AyudaPanel.Visible = 'off';
            app.AyudaPanel.Position = [179 188 260 221];

            % Create OKButton
            app.OKButton = uibutton(app.AyudaPanel, 'push');
            app.OKButton.ButtonPushedFcn = createCallbackFcn(app, @OKButtonPushed, true);
            app.OKButton.Position = [78 19 100 22];
            app.OKButton.Text = 'OK';

            % Create Label
            app.Label = uilabel(app.AyudaPanel);
            app.Label.HorizontalAlignment = 'center';
            app.Label.Position = [8 43 245 84];
            app.Label.Text = {'Agrega Valores a los cuadros de texto '; 'sobre la imagen y la aplicacion se encargara'; 'del resto'; ''; 'Gustavo de León 2018'; ':)'};

            % Create ALabel
            app.ALabel = uilabel(app.Calculadora);
            app.ALabel.BackgroundColor = [1 1 1];
            app.ALabel.FontWeight = 'bold';
            app.ALabel.Position = [198 367 25 22];
            app.ALabel.Text = 'A';

            % Create cmLabel
            app.cmLabel = uilabel(app.Calculadora);
            app.cmLabel.BackgroundColor = [1 1 1];
            app.cmLabel.FontWeight = 'bold';
            app.cmLabel.Position = [259 167 25 20];
            app.cmLabel.Text = 'cm';

            % Create cmLabel_2
            app.cmLabel_2 = uilabel(app.Calculadora);
            app.cmLabel_2.BackgroundColor = [1 1 1];
            app.cmLabel_2.FontWeight = 'bold';
            app.cmLabel_2.Position = [309 187 21 19];
            app.cmLabel_2.Text = 'cm';

            % Create cmLabel_3
            app.cmLabel_3 = uilabel(app.Calculadora);
            app.cmLabel_3.BackgroundColor = [1 1 1];
            app.cmLabel_3.FontWeight = 'bold';
            app.cmLabel_3.Position = [369 167 25 22];
            app.cmLabel_3.Text = 'cm';

            % Create cmLabel_4
            app.cmLabel_4 = uilabel(app.Calculadora);
            app.cmLabel_4.BackgroundColor = [1 1 1];
            app.cmLabel_4.FontWeight = 'bold';
            app.cmLabel_4.Position = [489 187 25 22];
            app.cmLabel_4.Text = 'cm';

            % Create cmLabel_5
            app.cmLabel_5 = uilabel(app.Calculadora);
            app.cmLabel_5.BackgroundColor = [1 1 1];
            app.cmLabel_5.FontWeight = 'bold';
            app.cmLabel_5.Position = [499 257 25 22];
            app.cmLabel_5.Text = 'cm';

            % Create cmLabel_6
            app.cmLabel_6 = uilabel(app.Calculadora);
            app.cmLabel_6.BackgroundColor = [1 1 1];
            app.cmLabel_6.FontWeight = 'bold';
            app.cmLabel_6.Position = [470 306 25 22];
            app.cmLabel_6.Text = 'cm';

            % Create cmLabel_7
            app.cmLabel_7 = uilabel(app.Calculadora);
            app.cmLabel_7.BackgroundColor = [1 1 1];
            app.cmLabel_7.FontWeight = 'bold';
            app.cmLabel_7.Position = [489 356 25 22];
            app.cmLabel_7.Text = 'cm';

            % Create VueltasLabel
            app.VueltasLabel = uilabel(app.Calculadora);
            app.VueltasLabel.BackgroundColor = [1 1 1];
            app.VueltasLabel.FontWeight = 'bold';
            app.VueltasLabel.Position = [282 307 48 22];
            app.VueltasLabel.Text = 'Vueltas';

            % Create VoltajeEditFieldLabel
            app.VoltajeEditFieldLabel = uilabel(app.Calculadora);
            app.VoltajeEditFieldLabel.HorizontalAlignment = 'right';
            app.VoltajeEditFieldLabel.Position = [294 10 42 22];
            app.VoltajeEditFieldLabel.Text = 'Voltaje';

            % Create Resultado_Voltaje
            app.Resultado_Voltaje = uieditfield(app.Calculadora, 'numeric');
            app.Resultado_Voltaje.Editable = 'off';
            app.Resultado_Voltaje.Position = [351 10 100 22];

            % Create VCALabel
            app.VCALabel = uilabel(app.Calculadora);
            app.VCALabel.BackgroundColor = [1 1 1];
            app.VCALabel.FontWeight = 'bold';
            app.VCALabel.Position = [179 257 38 32];
            app.VCALabel.Text = 'V C/A';

            % Create TeslasLabel
            app.TeslasLabel = uilabel(app.Calculadora);
            app.TeslasLabel.Position = [494 51 40 22];
            app.TeslasLabel.Text = 'Teslas';

            % Create VoltiosLabel
            app.VoltiosLabel = uilabel(app.Calculadora);
            app.VoltiosLabel.Position = [458 10 41 22];
            app.VoltiosLabel.Text = 'Voltios';
        end
    end

    methods (Access = public)

        % Construct app
        function app = Calculadora_de_Transformadores_Exportado

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.Calculadora)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.Calculadora)
        end
    end
end