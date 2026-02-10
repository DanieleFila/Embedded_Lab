classdef udpDataLoggerApp < matlab.apps.AppBase
    %UDPDATALOGGERAPP
    %   
    %   Riccardo Antonello (riccardo.antonello@unipd.it)
    %   
    %   December 08, 2025
    %   
    %   Dept. of Information Engineering, University of Padova

    % Properties that correspond to app components
    properties (Access = public)
        UdpDataLoggerAppUIFigure        matlab.ui.Figure
        UIFigureGridLayout              matlab.ui.container.GridLayout
        StatusPanel                     matlab.ui.container.Panel
        StatusPanelGridLayout           matlab.ui.container.GridLayout
        ConnectedLamp                   matlab.ui.control.Lamp
        ConnectedLampLabel              matlab.ui.control.Label
        ConnectSwitch                   matlab.ui.control.Switch
        TabGroup                        matlab.ui.container.TabGroup
        ConnectionTab                   matlab.ui.container.Tab
        ConnectionTabGridLayout         matlab.ui.container.GridLayout
        LocalUDPPortEditField           matlab.ui.control.NumericEditField
        LocalUDPPortEditFieldLabel      matlab.ui.control.Label
        StartStopCmdCheckBox            matlab.ui.control.CheckBox
        StartStopCmdPanel               matlab.ui.container.Panel
        StartStopGridLayout             matlab.ui.container.GridLayout
        RemoteIpAddressEditField        matlab.ui.control.EditField
        RemoteIPAddressEditFieldLabel_2  matlab.ui.control.Label
        RemoteUdpPortEditField          matlab.ui.control.NumericEditField
        RemoteUDPPortEditFieldLabel     matlab.ui.control.Label
        StopByteEditField               matlab.ui.control.NumericEditField
        StopbyteEditFieldLabel          matlab.ui.control.Label
        StartByteEditField              matlab.ui.control.NumericEditField
        StartbyteEditFieldLabel         matlab.ui.control.Label
        PacketTab                       matlab.ui.container.Tab
        PacketTabGridLayout             matlab.ui.container.GridLayout
        PacketStructLabel               matlab.ui.control.Label
        PacketStructUITable             matlab.ui.control.Table
        COBSEncodedCheckBox             matlab.ui.control.CheckBox
        NullTermCheckBox                matlab.ui.control.CheckBox
        LogTab                          matlab.ui.container.Tab
        LogTabGridLayout                matlab.ui.container.GridLayout
        LogToWorkspaceCheckBox          matlab.ui.control.CheckBox
        LogToWorkspacePanel             matlab.ui.container.Panel
        LogToWorkspaceGridLayout        matlab.ui.container.GridLayout
        SaveToWorkspaceOnExitCheckBox   matlab.ui.control.CheckBox
        SaveToWorkspaceButton           matlab.ui.control.Button
        VarNameEditField                matlab.ui.control.EditField
        VariablenameEditFieldLabel      matlab.ui.control.Label
        TxSampleTimeEditField           matlab.ui.control.NumericEditField
        TxSampleTimesEditFieldLabel     matlab.ui.control.Label
        BufferSizeEditField             matlab.ui.control.NumericEditField
        BuffersizeEditFieldLabel        matlab.ui.control.Label
        ClearBufferButton               matlab.ui.control.Button
        PlotsTab                        matlab.ui.container.Tab
        PlotsTabGridLayout              matlab.ui.container.GridLayout
        PlotGridRowsEditField           matlab.ui.control.NumericEditField
        PlotGridColsEditField           matlab.ui.control.NumericEditField
        RefreshRatioLabel               matlab.ui.control.Label
        PlotsUITree                     matlab.ui.container.CheckBoxTree
        PlotgridrowscolsEditFieldLabel  matlab.ui.control.Label
        XYAxesTabGroup                  matlab.ui.container.TabGroup
        XAxisTab                        matlab.ui.container.Tab
        XAxisTabGridLayout              matlab.ui.container.GridLayout
        XAxisUITable                    matlab.ui.control.Table
        YAxisTab                        matlab.ui.container.Tab
        YAxisTabGridLayout              matlab.ui.container.GridLayout
        YAxisUITable                    matlab.ui.control.Table
        RefreshRatioEditField           matlab.ui.control.NumericEditField
        PlotGridLabel                   matlab.ui.control.Label
        PlotsPanel                      matlab.ui.container.Panel
        PlotsPanelGridLayout            matlab.ui.container.GridLayout
        PacketStructUITable_ContextMenu  matlab.ui.container.ContextMenu
        PacketStructUITable_AddRowMenu  matlab.ui.container.Menu
        PacketStructUITable_DeleteRowMenu  matlab.ui.container.Menu
        PacketStructUITable_MoveUpMenu  matlab.ui.container.Menu
        PacketStructUITable_MoveDownMenu  matlab.ui.container.Menu
        Signals_ContextMenu             matlab.ui.container.ContextMenu
        Signals_ColorMenu               matlab.ui.container.Menu
        Signals_LineStyleMenu           matlab.ui.container.Menu
        Signals_LineStyle_solidMenu     matlab.ui.container.Menu
        Signals_LineStyle_dashMenu      matlab.ui.container.Menu
        Signals_LineStyle_dotMenu       matlab.ui.container.Menu
        Signals_LineStyle_dashdotMenu   matlab.ui.container.Menu
        Signals_LineStyle_noneMenu      matlab.ui.container.Menu
        Signals_LineWidthMenu           matlab.ui.container.Menu
        Signals_LineWidth_Menu_0p5      matlab.ui.container.Menu
        Signals_LineWidth_Menu_1        matlab.ui.container.Menu
        Signals_LineWidth_Menu_2        matlab.ui.container.Menu
        Signals_LineWidth_Menu_3        matlab.ui.container.Menu
        Signals_LineWidth_Menu_4        matlab.ui.container.Menu
        Signals_LineWidth_Menu_5        matlab.ui.container.Menu
        Signals_LineWidth_Menu_6        matlab.ui.container.Menu
        Signals_MarkerMenu              matlab.ui.container.Menu
        Signals_Marker_CircleMenu       matlab.ui.container.Menu
        Signals_Marker_PlusSignMenu     matlab.ui.container.Menu
        Signals_Marker_AsteriskMenu     matlab.ui.container.Menu
        Signals_Marker_PointMenu        matlab.ui.container.Menu
        Signals_Marker_CrossMenu        matlab.ui.container.Menu
        Signals_Marker_SquareMenu       matlab.ui.container.Menu
        Signals_Marker_DiamondMenu      matlab.ui.container.Menu
        Signals_Marker_UpTriangleMenu   matlab.ui.container.Menu
        Signals_Marker_DownTriangleMenu  matlab.ui.container.Menu
        Signals_Marker_RightTriangleMenu  matlab.ui.container.Menu
        Signals_Marker_LeftTriangleMenu  matlab.ui.container.Menu
        Signals_Marker_PentagramMenu    matlab.ui.container.Menu
        Signals_Marker_HexagramMenu     matlab.ui.container.Menu
        Signals_Marker_NoneMenu         matlab.ui.container.Menu
        Signals_MarkerSizeMenu          matlab.ui.container.Menu
        Signals_MarkerSize_Menu_2       matlab.ui.container.Menu
        Signals_MarkerSize_Menu_4       matlab.ui.container.Menu
        Signals_MarkerSize_Menu_6       matlab.ui.container.Menu
        Signals_MarkerSize_Menu_8       matlab.ui.container.Menu
        Signals_MarkerSize_Menu_10      matlab.ui.container.Menu
        Signals_MarkerSize_Menu_12      matlab.ui.container.Menu
        Signals_MarkerSize_Menu_14      matlab.ui.container.Menu
        Signals_MarkerSize_Menu_16      matlab.ui.container.Menu
        Signals_MarkerSize_Menu_18      matlab.ui.container.Menu
        Signals_MarkerSize_Menu_20      matlab.ui.container.Menu
        Signals_MarkerSize_Menu_22      matlab.ui.container.Menu
        Signals_MarkerSize_Menu_24      matlab.ui.container.Menu
        Plots_ContextMenu               matlab.ui.container.ContextMenu
        Plots_ShowLegendMenu            matlab.ui.container.Menu
        Plots_LegendLocationMenu        matlab.ui.container.Menu
        Plots_Legend_LocationNorthMenu  matlab.ui.container.Menu
        Plots_Legend_LocationSouthMenu  matlab.ui.container.Menu
        Plots_Legend_LocationEastMenu   matlab.ui.container.Menu
        Plots_Legend_LocationWestMenu   matlab.ui.container.Menu
        Plots_Legend_LocationNorthEastMenu  matlab.ui.container.Menu
        Plots_Legend_LocationNorthWestMenu  matlab.ui.container.Menu
        Plots_Legend_LocationSouthEastMenu  matlab.ui.container.Menu
        Plots_Legend_LocationSouthWestMenu  matlab.ui.container.Menu
        Plots_Legend_LocationBestMenu   matlab.ui.container.Menu
        Plots_HideLegendMenu            matlab.ui.container.Menu
        ContextMenu                     matlab.ui.container.ContextMenu
        AboutMenu                       matlab.ui.container.Menu
    end


    % Public properties that correspond to the Simulink model
    properties (Access = public, Transient)
        Simulation simulink.Simulation
    end

    
    properties (Access = private)
        uiAxes
        udpPortObj
        packetSpec
        packetInfo
        logLastSampleIndex
        logLastTimeInstant
        logBuffer
        logTempBuffer
        cfgParams
    end

    properties (Access = private, Constant)

        %   supported data types names
        validDTypeNames = {
            'double',   ...
            'single',   ...
            'int8',    ...
            'uint8',    ...
            'int16',    ...
            'uint16',    ...
            'int32',    ...
            'uint32'  };

        %   supported data types byte sizes
        validDTypeSize = [
            8, ...
            4, ...
            1, ...
            1, ...
            2, ...
            2, ...
            4, ...
            4 ];

        %   max values
        maxBufferSize = 1e6;
        maxPlotsNum = 100;
        maxSignalsNum = 100;
        maxComponentsNum = 100;

        %   default config params
        defaultParams = struct( ...
            'localUdpPort', 0, ...              %   local UDP port
            'remoteUdpPort', 0, ...             %   remote UDP port
            'remoteIpAddress', "127.0.0.1", ... %   remote IP address
            'enableStartStopCmds', false, ...   %   start/stop cmds
            'txStartCmd', 65, ...               %
            'txStopCmd', 66, ...                %
            'packetSpec', {{'uint8'}}, ...      %   packet spec
            'enableCOBS', true, ...             %   encoding
            'enableNullTerminator', true, ...   %
            'bufferSize', 1000, ...             %   data logging params
            'txSampleTime', 1, ...              %
            'enableLogToWorkspace', true, ...   %
            'enableSaveOnExit', true, ...       %
            'varName', "data", ...              %
            'plotsGridSize', [1, 1], ...        %   plots params
            'plotsContentList', [], ...         %
            'plotsDuration', 1, ...             %
            'plotsRefreshRatio', 4);            %
    end
    
    methods (Access = private, Static)

        %%  Input arguments validation functions

        % --------------------------------------------------------------- %
        %   mustBeValidIpAddress
        %
        %   Validate IPv4 address
        %
        function mustBeValidIpAddress(ipAddr)

            %   convert to string
            ipAddr = string(ipAddr);

            %   pattern for one IPv4 octet (0–255)
            octet = ...
                "25" + digitsPattern(1,1) | ...                      % 250–255
                "2"  + digitsPattern(1,1) + digitsPattern(1,1) | ... % 200–249
                "1"  + digitsPattern(1,2) | ...                      % 100–199
                digitsPattern(1,2) | ...                             % 0–99
                "0";                                                 % Allow single 0

            %   full IPv4 pattern
            ipv4Pattern = octet + "." + octet + "." + octet + "." + octet;

            %   validate ip addddress
            if ~matches(ipAddr, ipv4Pattern)
                error("'%s' is not a valid data IPv4 address.", ipAddr);
            end

        end

        % --------------------------------------------------------------- %
        %   mustBeValidPacketSpec
        %
        %   Validate packetSpec input argument
        %
        function mustBeValidPacketSpec(packetSpec)

            %   pattern for valid signal width (positive integer)
            validWidthPat = regexpPattern("[1-9][0-9]*");

            %   pattern for valid signal data type
            validTypePat = "double" | "single" | "int8" | "uint8" | ...
                "int16" | "uint16" | "int32" | "uint32";

            %   pattern for valid signal width and type
            validSpecPat = optionalPattern(validWidthPat + "*") + validTypePat;

            %   parse packetSpec input argument
            cellsNum = numel(packetSpec);
            for n = 1:cellsNum

                if ~matches(packetSpec{n}, validSpecPat)
                    error("'%s' is not a valid data type specifier.", packetSpec{n});
                end

            end

        end

        % --------------------------------------------------------------- %
        %   mustBeValidBufferSize
        %
        %   Validate bufferSize input argument
        %
        function mustBeValidBufferSize(bufferSize)
            mustBeInteger(bufferSize);
            %mustBeBetween(bufferSize, 1, udpDataLoggerApp.maxBufferSize);
            mustBeGreaterThanOrEqual(bufferSize, 1);
            mustBeLessThanOrEqual(bufferSize, udpDataLoggerApp.maxBufferSize);
        end

        % --------------------------------------------------------------- %
        %   mustBeValidPlotsRefreshRatio
        %
        %   Validate plotsRefreshRatio input argument
        %
        function mustBeValidPlotsRefreshRatio(plotsRefreshRatio)
            mustBeInteger(plotsRefreshRatio); 
            %mustBeBetween(plotsRefreshRatio, 1, udpDataLoggerApp.maxBufferSize);
            mustBeGreaterThanOrEqual(plotsRefreshRatio, 1);
            mustBeLessThanOrEqual(plotsRefreshRatio, udpDataLoggerApp.maxBufferSize);
        end

        % --------------------------------------------------------------- %
        %   mustBeValidPlotsGridSize
        %
        %   Validate plotsGridSize input argument
        %
        function mustBeValidPlotsGridSize(plotsGridSize)
            mustBeInteger(plotsGridSize);
            mustBePositive(plotsGridSize);
            mustBeVector(plotsGridSize);

            if numel(plotsGridSize) ~= 2
                error("Input argument must be a 2-element vector");
            end
        end

        % --------------------------------------------------------------- %
        %   mustBeValidPlotsContentList
        %
        %   Validate plotsContentList input argument
        %
        function mustBeValidPlotsContentList(plotsContentList)
            mustBeInteger(plotsContentList);
            mustBePositive(plotsContentList);
            mustBeMatrix(plotsContentList);

            if ~isempty(plotsContentList) && size(plotsContentList,2) ~= 3
                error("Input argument must be a 3-columns matrix");
            end
        end

    end
    
    methods (Access = private)
        
        %%  App config management

        % --------------------------------------------------------------- %
        %   AppConfig_ParseInputArgs
        %
        %   Parse optional app input arguments
        %
        function cfgParams = AppConfig_ParseInputArgs(app, args)

            arguments
                app (1,1) udpDataLoggerApp
                %args.localUdpPort (1,1) {mustBeInteger, mustBeBetween(args.localUdpPort, 0, 65535)} = 0;
                args.localUdpPort (1,1) {mustBeInteger, ...
                    mustBeGreaterThanOrEqual(args.localUdpPort, 0), ...
                    mustBeLessThanOrEqual(args.localUdpPort, 65535)} = 0;
                %args.remoteUdpPort (1,1)  {mustBeInteger, mustBeBetween(args.remoteUdpPort, 0, 65535)} = 0;
                args.remoteUdpPort (1,1)  {mustBeInteger, ...
                    mustBeGreaterThanOrEqual(args.remoteUdpPort, 0), ...
                    mustBeLessThanOrEqual(args.remoteUdpPort, 65535)} = 0;
                args.remoteIpAddress (1,1) {mustBeTextScalar, udpDataLoggerApp.mustBeValidIpAddress} = "127.0.0.1";       
                args.enableStartStopCmds (1,1) {mustBeA(args.enableStartStopCmds, 'logical')} = udpDataLoggerApp.defaultParams.enableStartStopCmds;
                %args.txStartCmd (1,1) {mustBeInteger, mustBeBetween(args.txStartCmd, 0, 255)} = udpDataLoggerApp.defaultParams.txStartCmd;
                args.txStartCmd (1,1) {mustBeInteger, ...
                    mustBeGreaterThanOrEqual(args.txStartCmd, 0), ...
                    mustBeLessThanOrEqual(args.txStartCmd, 255)} = udpDataLoggerApp.defaultParams.txStartCmd;
                %args.txStopCmd (1,1) {mustBeInteger, mustBeBetween(args.txStopCmd, 0, 255)} = udpDataLoggerApp.defaultParams.txStopCmd;
                args.txStopCmd (1,1) {mustBeInteger, ...
                    mustBeGreaterThanOrEqual(args.txStopCmd, 0), ...
                    mustBeLessThanOrEqual(args.txStopCmd, 255)} = udpDataLoggerApp.defaultParams.txStopCmd;
                args.packetSpec cell {mustBeText, udpDataLoggerApp.mustBeValidPacketSpec} = udpDataLoggerApp.defaultParams.packetSpec;
                args.enableCOBS (1,1) {mustBeA(args.enableCOBS, 'logical')} = udpDataLoggerApp.defaultParams.enableCOBS;
                args.enableNullTerminator (1,1) {mustBeA(args.enableNullTerminator, 'logical')} = udpDataLoggerApp.defaultParams.enableNullTerminator;
                args.bufferSize (1,1) {udpDataLoggerApp.mustBeValidBufferSize} = udpDataLoggerApp.defaultParams.bufferSize;
                args.txSampleTime (1,1) {mustBeNumeric, mustBePositive} = udpDataLoggerApp.defaultParams.txSampleTime;
                args.enableLogToWorkspace (1,1) {mustBeA(args.enableLogToWorkspace, 'logical')} = udpDataLoggerApp.defaultParams.enableLogToWorkspace;
                args.enableSaveOnExit (1,1) {mustBeA(args.enableSaveOnExit, 'logical')} = udpDataLoggerApp.defaultParams.enableSaveOnExit;
                args.varName {mustBeTextScalar} = udpDataLoggerApp.defaultParams.varName;
                args.plotsGridSize {udpDataLoggerApp.mustBeValidPlotsGridSize} = udpDataLoggerApp.defaultParams.plotsGridSize;
                args.plotsContentList {udpDataLoggerApp.mustBeValidPlotsContentList} = udpDataLoggerApp.defaultParams.plotsContentList;
                args.plotsDuration (1,1) {mustBeNumeric, mustBePositive} = udpDataLoggerApp.defaultParams.plotsDuration;
                args.plotsRefreshRatio (1,1) {udpDataLoggerApp.mustBeValidPlotsRefreshRatio} = udpDataLoggerApp.defaultParams.plotsRefreshRatio;
            end

            %   validate plot list
            plotsContentListLength = size(args.plotsContentList, 1);
            plotsNum = prod(args.plotsGridSize);
            signalsNum = numel(args.packetSpec);
            componentsNum = arrayfun(@(s) sscanf(s,'%d'), string(args.packetSpec), 'UniformOutput', false);
            emptyCellsNum = find(arrayfun(@(x) isempty(x{1}), componentsNum));
            for k = 1:numel(emptyCellsNum)
                componentsNum{emptyCellsNum(k)} = 1;
            end
            componentsNum = cell2mat(componentsNum);

            for n = 1:plotsContentListLength
                
                p = args.plotsContentList(n,1);
                s = args.plotsContentList(n,2);
                c = args.plotsContentList(n,3);

                %   validate plot number
                if ~ismember(p, 1:plotsNum)
                    error("Invalid entry in PlotsContentList - %d) [%d %d %d]. The plot number must be in the range [1,%d]", ...
                        n, p, s, c, plotsNum)
                end

                %   validate signal number
                if ~ismember(s, 1:signalsNum)
                    error("Invalid entry in PlotsContentList - %d) [%d %d %d]. The signal number must be in the range [1,%d]", ...
                        n, p, s, c, signalsNum)
                end

                %   validate component number
                if ~ismember(c, 1:componentsNum(s))
                    error("Invalid entry in PlotsContentList - %d) [%d %d %d]. The component number for signal %d must be in the range [1,%d]", ...
                        n, p, s, c, s, componentsNum(s))
                end
                
            end

            %   save configurations to return param
            cfgParams = args;

        end


        %%  Packet management

        % --------------------------------------------------------------- %
        %   Packet_IsStructureValid
        %
        %   Check packet structure
        %
        function isValid = Packet_IsStructureValid(app)
            
            isValid = false;
            signalsNum = height(app.PacketStructUITable.Data);
            for n = 1:signalsNum
                signalDType = app.PacketStructUITable.Data{n,2};
                signalDim = app.PacketStructUITable.Data{n,3};

                if isundefined(signalDType)
                    errordlg( ...
                        sprintf('Packet structure error: signal %d has unspecified type.', n), ...
                        'Error', 'modal');
                    return
                end

                if signalDim <= 0
                    errordlg( ...
                        sprintf('Packet structure error: signal %d has zero width.', n), ...
                        'Error', 'modal');
                    return
                end

            end

            isValid = true;

        end

        % --------------------------------------------------------------- %
        %   Packet_UpdateInfoStruct   
        %
        %   Update packet info struct
        %
        function Packet_UpdateInfoStruct(app, varargin)
            
            [cellsNum, ~] = size(app.PacketStructUITable.Data);
            
            cellDType = cell(1, cellsNum);
            cellDTypeSize = zeros(1, cellsNum);
            cellWidth = zeros(1, cellsNum);
            byteSize = 0;

            for n = 1:cellsNum
                cellDType{n} = char(app.PacketStructUITable.Data{n,2});
                [~, validDTypeIdx] = ismember(cellDType{n}, app.validDTypeNames);
                cellDTypeSize(n) = app.validDTypeSize(validDTypeIdx);
                cellWidth(n) = app.PacketStructUITable.Data{n,3};
                byteSize = byteSize + cellDTypeSize(n)*cellWidth(n);
            end

            app.packetInfo.byteSize = byteSize;
            app.packetInfo.cellsNum = cellsNum;
            app.packetInfo.cellDType = cellDType;
            app.packetInfo.cellDTypeSize = cellDTypeSize;
            app.packetInfo.cellWidth = cellWidth;
        end


        %%  UDP communication management
        
        % --------------------------------------------------------------- %
        %   UdpPort_CallbackFun
        %
        %   UDP port callback function
        %
        function UdpPort_CallbackFun(app, src, evt)

            %   eval expected packet length
            packetLength = app.packetInfo.byteSize;

            if app.COBSEncodedCheckBox.Value
                packetLength = packetLength + 1; % +1 byte for COBS encoding
            end

            if app.NullTermCheckBox.Value
                packetLength = packetLength + 1; % +1 for null terminator
            end

            %   exit if the received data is less than packet length
            receivedDataLength = app.udpPortObj.NumBytesAvailable;
            if receivedDataLength < packetLength
                return
            end

            %   get Tx sample time
            Ts = app.TxSampleTimeEditField.Value;

            %   read and decode received packets
            receivedPacketsNum = floor(receivedDataLength/packetLength);
            for np = 1:receivedPacketsNum

                %   read data
                data = uint8(read(app.udpPortObj, packetLength, "uint8"));

                %   remove null terminator from data
                if app.NullTermCheckBox.Value
                    data = data(1:end-1);
                end

                %   perform COBS decoding
                if app.COBSEncodedCheckBox.Value
                    data = cobsDecode(data);
                end

                %   unpack data
                data = dataUnpack(data, app.packetInfo);

                %   update index and time of last logged sample
                app.logLastSampleIndex = app.logLastSampleIndex + 1;
                app.logLastTimeInstant = app.logLastTimeInstant + Ts;

                %   store data to temp buffer
                app.logTempBuffer.sampleIndex(app.logTempBuffer.tailPos) = app.logLastSampleIndex;
                app.logTempBuffer.time(app.logTempBuffer.tailPos) = app.logLastTimeInstant;
                for n = 1:app.packetInfo.cellsNum
                    app.logTempBuffer.signals{n}(:,app.logTempBuffer.tailPos) = data{n}.';
                end

                %   update data buffers and plots
                if app.logTempBuffer.tailPos >= app.logTempBuffer.size

                    %   store temp buffer to log buffer
                    if app.logBuffer.tailPos >= app.logBuffer.size

                        %   shift old data left if exceeding buffer size
                        app.logBuffer.sampleIndex = circshift(app.logBuffer.sampleIndex, -app.logTempBuffer.size);
                        app.logBuffer.time = circshift(app.logBuffer.time, -app.logTempBuffer.size);
                        for n = 1:app.packetInfo.cellsNum
                            app.logBuffer.signals{n} = circshift(app.logBuffer.signals{n}, -app.logTempBuffer.size, 2);
                        end

                        %   add temp buffer data to log buffer tail
                        range = app.logBuffer.size - (app.logTempBuffer.size-1:-1:0);
                        app.logBuffer.sampleIndex(range) = app.logTempBuffer.sampleIndex;
                        app.logBuffer.time(range) = app.logTempBuffer.time;
                        for n = 1:app.packetInfo.cellsNum
                            app.logBuffer.signals{n}(:,range) = app.logTempBuffer.signals{n};
                        end

                    else

                        %   append temp buffer data to log buffer data
                        range = app.logBuffer.tailPos + (0:app.logTempBuffer.size-1);
                        app.logBuffer.sampleIndex(range) = app.logTempBuffer.sampleIndex;
                        app.logBuffer.time(range) = app.logTempBuffer.time;
                        for n = 1:app.packetInfo.cellsNum
                            app.logBuffer.signals{n}(:,range) = app.logTempBuffer.signals{n};
                        end

                        %   update log buffer tail position
                        app.logBuffer.tailPos = app.logBuffer.tailPos + app.logTempBuffer.size;

                    end

                    %   update plots
                    plotsNum = length(app.uiAxes);
                    for plotId = 1:plotsNum
                        if ishandle(app.uiAxes(plotId))

                            %   get plot x-axis unit and duration
                            p = find(app.XAxisUITable.Data.('Plot #') == plotId);
                            xUnit = app.XAxisUITable.Data.Unit(p);
                            duration = app.XAxisUITable.Data.Duration(p);

                            %   extract signals and animatedlines info
                            signalUid = app.uiAxes(plotId).UserData.signalUid;
                            animatedLineObj = app.uiAxes(plotId).UserData.animatedLineObj;

                            %   add points to animatedlines
                            animatedLinesNum = length(animatedLineObj);
                            for l = 1:animatedLinesNum
                                s = signalUid(l,2);      %   signal num
                                c = signalUid(l,3);      %   component num
                                if xUnit == "Sample #"
                                    addpoints(animatedLineObj(l), ...
                                        app.logTempBuffer.sampleIndex, ...
                                        app.logTempBuffer.signals{s}(c,:));
                                else
                                    addpoints(animatedLineObj(l), ...
                                        app.logTempBuffer.time, ...
                                        app.logTempBuffer.signals{s}(c,:));
                                end
                            end

                            %   scroll x-axis
                            if xUnit == "Sample #"
                                if app.logLastSampleIndex > duration
                                    set(app.uiAxes(plotId), ...
                                        'XLim', app.logLastSampleIndex + [-duration, 0]);
                                end
                            else
                                if app.logLastTimeInstant > duration
                                    set(app.uiAxes(plotId), ...
                                        'XLim', app.logLastTimeInstant + [-duration, 0]);
                                end
                            end

                        end
                    end

                    %   refresh plots
                    drawnow update;

                    %   reset temp buffer
                    app.logTempBuffer.size = app.RefreshRatioEditField.Value;
                    app.logTempBuffer.tailPos = 0;
                    app.logTempBuffer.sampleIndex = NaN*ones(1, app.logTempBuffer.size);
                    app.logTempBuffer.time = NaN*ones(1, app.logTempBuffer.size);
                    for n = 1:app.packetInfo.cellsNum
                        app.logTempBuffer.signals{n} = NaN*ones(app.packetInfo.cellWidth(n), app.logTempBuffer.size);
                    end

                end
                
                %   update temp buffer tail pos
                app.logTempBuffer.tailPos = app.logTempBuffer.tailPos + 1;
                
            end

        end

        % --------------------------------------------------------------- %
        %   UdpPort_Connect   
        %
        %   UDP port connect
        %
        function UdpPort_Connect(app)

            %   check packet structure
            if ~app.Packet_IsStructureValid()
                app.ConnectSwitch.Value = "Off";             %  force switch off
                app.ConnectedLamp.Color = 0.65 * [1, 1, 1];  %  set lamp to gray
                return
            end

            %   try to connect to UDP port ...
            try
                app.udpPortObj = udpport(...
                    "byte", "IPV4", ...
                    "LocalPort", app.LocalUDPPortEditField.Value);
            catch err
                errordlg(err.message, 'Error', 'modal');
                app.ConnectSwitch.Value = "Off";            %  force switch off
                app.ConnectedLamp.Color = 0.65 * [1, 1, 1]; %  set lamp to gray
                return
            end

            %   ... connected - set lamp to green
            app.ConnectedLamp.Color = [0, 1, 0];

            %   disable Connection and Packet Tabs
            set(app.ConnectionTabGridLayout.Children, 'Enable', 'off');
            set(app.PacketTabGridLayout.Children, 'Enable', 'off');

            %   update packet info struct        
            app.Packet_UpdateInfoStruct();          

            %   flush buffer
            flush(app.udpPortObj, "input");

            %   set callback function and trigger condition
            if app.NullTermCheckBox.Value
                configureTerminator(app.udpPortObj, 0);
                configureCallback(app.udpPortObj, ...
                    "terminator", @(src, evt) UdpPort_CallbackFun(app, src, evt) );
            else
                if app.COBSEncodedCheckBox.Value
                    packetLength = app.packetInfo.byteSize + 1;     % +1 for COBS encoding
                else
                    packetLength = app.packetInfo.byteSize;
                end
                configureCallback(app.udpPortObj, ...
                    "byte", packetLength,  @(src, evt) UdpPort_CallbackFun(app, src, evt) );
            end

            %   send Tx start command (if option enabled)
            if app.StartStopCmdCheckBox.Value
                startCmd = app.StartByteEditField.Value;
                write(app.udpPortObj, uint8(startCmd), 'uint8', ...
                    app.RemoteIpAddressEditField.Value, ...
                    app.RemoteUdpPortEditField.Value);
            end

        end

        % --------------------------------------------------------------- %
        %   UdpPort_Disconnect   
        %
        %   UDP port disconnect
        %
        function UdpPort_Disconnect(app)

            %   send Tx stop command (if option enabled)
            if app.StartStopCmdCheckBox.Value
                stopCmd = app.StopByteEditField.Value;
                write(app.udpPortObj, uint8(stopCmd), 'uint8', ...
                    app.RemoteIpAddressEditField.Value, ...
                    app.RemoteUdpPortEditField.Value);
            end

            %    disconnect from UDP port
            delete(app.udpPortObj);

            %   set lamp to gray
            app.ConnectedLamp.Color = 0.65 * [1, 1, 1];

            %   enable Connection and Packet Tabs
            set(app.ConnectionTabGridLayout.Children, 'Enable', 'on');
            set(app.PacketTabGridLayout.Children, 'Enable', 'on');

        end


        %%  UI management - PacketStructUITable

        % --------------------------------------------------------------- %
        %   PacketStructUITable_Init
        %
        %   Initialize table with given packet specifier
        %
        %   Note: assumes a valid packet specifier
        %
        function PacketStructUITable_Init(app, packetSpec)

            %   initialize table
            cellsNum = length(packetSpec);
            app.PacketStructUITable.Data = table( ...
                'Size', [cellsNum, 3], ...
                'VariableNames', {'#', 'DataType', 'Dimension'}, ...
                'VariableTypes', {'uint8', 'categorical', 'uint8'} );

            %   parse packetSpec input argument
            cellDType = strings(cellsNum,1);
            cellWidth = ones(cellsNum,1);
            for n = 1:cellsNum

                %   parse packetSpec cell
                cellWidth(n) = str2double( sscanf(packetSpec{n}, '%[0123456789]*') );
                if isnan(cellWidth(n))
                    cellDType(n) = sscanf(packetSpec{n}, '%s');
                    cellWidth(n) = 1;
                else
                    cellDType(n) = char(sscanf(packetSpec{n}, '%*d*%s')).';
                end

            end

            %   add table rows
            app.PacketStructUITable.Data.('#') = (1:cellsNum)';
            app.PacketStructUITable.Data.DataType = categorical(cellDType, app.validDTypeNames);
            app.PacketStructUITable.Data.Dimension = cellWidth;

        end

        % --------------------------------------------------------------- %
        %   PacketStructUITable_AddRow
        %
        %   Add uninitialized (empty) row above specified one
        %
        function PacketStructUITable_AddRow(app, rowId)

            %   return if row is out-of-range
            signalsNum = height(app.PacketStructUITable.Data);
            if ~ismember(rowId, 1:signalsNum)
                return
            end

            %   add extra row above specified row
            app.PacketStructUITable.Data = [ ...
                app.PacketStructUITable.Data(1:rowId-1,:); ...
                {NaN, "", 1}; ...
                app.PacketStructUITable.Data(rowId:end,:)];

            %   update signals #
            signalsNum = signalsNum+1;
            app.PacketStructUITable.Data{:,1} = (1:signalsNum).';

        end

        % --------------------------------------------------------------- %
        %   PacketStructUITable_AppendRow
        %   
        %   Append uninitialized (empty) row at table bottom
        %
        function PacketStructUITable_AppendRow(app)

            %   append row at bottom
            app.PacketStructUITable.Data = [ ...
                app.PacketStructUITable.Data; ...
                {NaN, "", 1} ];

            %   update signal #
            app.PacketStructUITable.Data{end,1} = height(app.PacketStructUITable.Data);

        end

        % --------------------------------------------------------------- %
        %   Remove table row
        %
        %   PacketStructUITable_DeleteRow
        %
        function PacketStructUITable_DeleteRow(app, rowId)
            
            %   return if row is out-of-range
            signalsNum = numel(app.PacketStructUITable.Data{:,1});
            if ~ismember(rowId, 1:signalsNum)
                return
            end

            %   remove row
            app.PacketStructUITable.Data(rowId,:) = [];             

            %   update signals #
            app.PacketStructUITable.Data{:,1} = (1:signalsNum-1).';

        end

        % --------------------------------------------------------------- %
        %   PacketStructUITable_MoveRowUp
        %
        %   Move table row up of one position
        %
        function PacketStructUITable_MoveRowUp(app, rowId)

            %   return if row is out-of-range
            signalsNum = numel(app.PacketStructUITable.Data{:,1});
            if ~ismember(rowId, 2:signalsNum)
                return
            end

            %   swap specified row with previous
            aux = app.PacketStructUITable.Data(rowId-1,:);
            app.PacketStructUITable.Data(rowId-1,:) = app.PacketStructUITable.Data(rowId,:);
            app.PacketStructUITable.Data(rowId,:) = aux;

            %   update signals #
            app.PacketStructUITable.Data{:,1} = (1:signalsNum).';

        end

        % --------------------------------------------------------------- %
        %   PacketStructUITable_MoveRowDown
        %
        %   Move table row down of one position
        %
        function PacketStructUITable_MoveRowDown(app, rowId)

            %   return if row is out-of-range
            signalsNum = numel(app.PacketStructUITable.Data{:,1});
            if ~ismember(rowId, 1:signalsNum-1)
                return
            end

            %   swap specified row with next
            aux = app.PacketStructUITable.Data(rowId+1,:);
            app.PacketStructUITable.Data(rowId+1,:) = app.PacketStructUITable.Data(rowId,:);
            app.PacketStructUITable.Data(rowId,:) = aux;

            %   update signals #
            app.PacketStructUITable.Data{:,1} = (1:signalsNum).';

        end


        %%  UI management - PlotsUITree

        % --------------------------------------------------------------- %
        %   PlotsUITree_Init
        %
        %   Build PlotsUITree
        %
        function PlotsUITree_Init(app)

            %   remove existing nodes
            nodes = app.PlotsUITree.Children;
            nodes.delete;

            %   get number of plots (grid locations)
            plotGridRowsNum = app.PlotGridRowsEditField.Value;
            plotGridColsNum = app.PlotGridColsEditField.Value;
            plotsNum = plotGridRowsNum * plotGridColsNum;

            %   get number of signals
            signalsNum = height(app.PacketStructUITable.Data);

            %   add nodes
            for p = 1:plotsNum
                for s = 1:signalsNum
                    componentsNum = app.PacketStructUITable.Data.Dimension(s);
                    for c = 1:componentsNum
                        app.PlotsUITree_AddNode([p, s, c]);
                    end
                end
            end

            %   check nodes
            if ~isempty(app.cfgParams.plotsContentList)
                nodes = findall(app.PlotsUITree, 'Type', 'uitreenode');
                matches = arrayfun(@(n) ismember(n.NodeData, app.cfgParams.plotsContentList, "rows"), nodes);
                app.PlotsUITree.CheckedNodes = nodes(matches);

                %   add signals to plots
                checkedNodesNum = numel(app.PlotsUITree.CheckedNodes);
                for n = 1:checkedNodesNum
                    signalUid = app.PlotsUITree.CheckedNodes(n).NodeData;
                    app.Plots_AddSignal(signalUid);
                end
            end

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_Update_OnPlotsGridChange
        %
        %   Invoked on a change of number of rows/cols in PlotsGrid:
        %   - Adds/removes plot nodes according to the requested number of plots
        %   - Assumes the packet structure currently stored in PacketStructUITable
        %
        function PlotsUITree_Update_OnPlotsGridChange(app)

            %   get requested number of plots (grid locations)
            plotGridRowsNum = app.PlotGridRowsEditField.Value;
            plotGridColsNum = app.PlotGridColsEditField.Value;
            requestedPlotsNum = plotGridRowsNum * plotGridColsNum;

            %   get current number of plots (grid locations)
            currentPlotsNum = numel(app.uiAxes);

            %   update PlotsUITree
            if requestedPlotsNum > currentPlotsNum

                %   extra plots are requested:
                %   - add extra plots nodes to PlotsUITree
                signalsNum = height(app.PacketStructUITable.Data);
                for p = currentPlotsNum+1:requestedPlotsNum
                    for s = 1:signalsNum
                        componentsNum = app.PacketStructUITable.Data.Dimension(s);
                        for c = 1:componentsNum
                            app.PlotsUITree_AddNode([p, s, c]);
                        end
                    end
                end

            else

                %   the requested plots are less than current ones:
                %   - remove extra plots nodes from PlotsUITree 
                %     (starting from bottom position)
                for p = currentPlotsNum:-1:(requestedPlotsNum+1)
                    app.PlotsUITree_DeleteNode([p, 0, 0]);
                end

            end

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_CheckedPlotsList
        %
        %   Get list of checked plots nodes in PlotsUITree
        %
        function checkedPlotsList = PlotsUITree_CheckedPlotsList(app)

            %   find checked plots
            n = find( arrayfun(@(x) ~isempty(x.NodeData), app.PlotsUITree.CheckedNodes) );
            checkedLeafs = app.PlotsUITree.CheckedNodes(n);
            checkedPlotsList = unique( arrayfun(@(x) x.NodeData(1), checkedLeafs) );

            %   force list as row vector
            checkedPlotsList = reshape(checkedPlotsList, 1, []);

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_AddNode
        %
        %   Add node to PlotsUITree
        %
        function PlotsUITree_AddNode(app, nodeUid)

            %   return in case of invalid nodeUid
            if ~app.PlotsUITree_IsValidNodeUid(nodeUid)
                return
            end

            %   iterate among tree levels
            parentNode = app.PlotsUITree;
            nodeUidLevel = app.PlotsUITree_NodeLevel(nodeUid);
            for l = 1:nodeUidLevel

                %   get available nodes at current tree level
                nodes = parentNode.Children;
                nodesNum = numel(nodes);

                %   get nodeId at current tree level
                nodeId = nodeUid(l);

                %   is there a node with specified id at current level ?
                if nodeId > nodesNum
                    
                    %   no node found
                    %   - create the new node, including all its previous
                    %   siblings not yet present at the current level
                    if nodesNum == 0

                        %   add 1st element at current level
                        node = uitreenode(parentNode);

                        %   add node data
                        uid = zeros(1,3);
                        uid(1:l) = [nodeUid(1:l-1), 1];
                        node.NodeData = uid;

                        %   add label
                        node.Text = app.PlotsUITree_NodeLabel(uid);

                    else

                        %   add all the nodes up to specified id
                        for n=nodesNum+1:nodeId

                            %   add node after last node at current level
                            node = uitreenode(...
                                parentNode, ...     %   parent node
                                nodes(n-1), ...     %   sibling node
                                "after");           %   add after sibling node

                            %   add node data
                            uid = zeros(1,3);
                            uid(1:l) = [nodeUid(1:l-1), n];
                            node.NodeData = uid;

                            %   add label
                            node.Text = app.PlotsUITree_NodeLabel(uid);

                        end

                    end

                else
    
                    %   node found
                    %
                    %   If nodeUid has the same level of current iteration:
                    %   - insert the new node before the existing one
                    %   - rename all the following nodes at the same tree level
                    %   - update NodeData of renamed nodes and their children
                    %
                    %   If nodeUid has a lower level than current iteration: 
                    %   - the node is an intermidiate node in the path toward
                    %     the final node; use it as the parent for the next 
                    %     iteration
                    %
                    if nodeUidLevel == l
                        
                        %   - rename following nodes
                        %   - update node data
                        for n=nodeId:nodesNum

                            %   select node
                            node = nodes(n);

                            %   update user data
                            toAdd = circshift([1, 0, 0], l-1);
                            app.PlotsUITree_AddToNodeData(node, toAdd);

                            %   update label
                            uid = node.NodeData;
                            node.Text = app.PlotsUITree_NodeLabel(uid);

                        end

                        %   insert new node
                        node = uitreenode(...
                            parentNode, ...         %   parent node
                            nodes(nodeId), ...      %   sibling node
                            "before");              %   add before sibling node
                        
                        %   add node data
                        node.NodeData = nodeUid;

                        %   add label
                        node.Text = app.PlotsUITree_NodeLabel(nodeUid);

                    else

                        %   the node is an intermidiate node in the path
                        %   toward the final node. Use it as the parent
                        %   node in the next iteration
                        node = nodes(nodeId);

                    end
                
                end

                %   update parent node for next iteration
                parentNode = node;

            end

            %   remove node from the checked nodes list
            %
            %   Notes: 
            %   - if the added node is a child of a checked node, it is 
            %     checked by default.
            %   - a node can be unchecked only if all of its ancestors are 
            %     also unchecked.
            %   
            checkedNodes = app.PlotsUITree.CheckedNodes;
            while ~isempty(node) && ~isa(node, 'matlab.ui.container.CheckBoxTree')
                checkedNodes(checkedNodes == node) = [];
                node = node.Parent;
            end
            app.PlotsUITree.CheckedNodes = checkedNodes;

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_DeleteNode
        %
        %   Delete node from PlotsUITree
        %
        function PlotsUITree_DeleteNode(app, nodeUid)
    
            %   return in case of invalid nodeUid
            if ~app.PlotsUITree_IsValidNodeUid(nodeUid)
                return
            end

            %   find node
            [node, parentNode, nodeId] = app.PlotsUITree_FindNode(nodeUid);
            
            %   not found ? return
            if ~ishandle(node)
                return
            end

            %   if there are following nodes on the same tree level:
            %   - rename the following nodes
            %   - update NodeData of following nodes and their children
            nodeLevel = app.PlotsUITree_NodeLevel(nodeUid);
            toAdd = circshift([-1, 0, 0], nodeLevel-1);
            nodesToRename = reshape(parentNode.Children(nodeId+1:end), 1, []);
            if ~isempty(nodesToRename)
                for nodeToRename = nodesToRename

                    %   update user data
                    app.PlotsUITree_AddToNodeData(nodeToRename, toAdd);

                    %   update label
                    uid = nodeToRename.NodeData;
                    nodeToRename.Text = app.PlotsUITree_NodeLabel(uid);

                end
            end

            %   delete node
            delete(node);

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_MoveNodeUp
        %
        %   Swap a node with the previous one in the same tree level
        %
        function PlotsUITree_MoveNodeUp(app, nodeUid)

            %   return in case of invalid nodeUid
            if ~app.PlotsUITree_IsValidNodeUid(nodeUid)
                return
            end

            %   find node to move up
            [node, parentNode, nodeId] = app.PlotsUITree_FindNode(nodeUid);

            %   not found ? return
            if ~ishandle(node)
                return
            end

            %   no previous node ? return
            if nodeId <=1
                return
            end

            %   get previous node
            prevNode = parentNode.Children(nodeId-1);

            %   swap nodes
            move(node, prevNode, 'before');

            %   swap node labels
            nodeText = node.Text;
            prevNodeText = prevNode.Text;

            node.Text = prevNodeText;
            prevNode.Text = nodeText;

            %   update node data            
            nodeLevel = PlotsUITree_NodeLevel(app, nodeUid);
            
            toAdd = circshift([-1, 0, 0], nodeLevel-1);
            app.PlotsUITree_AddToNodeData(node, toAdd);
            app.PlotsUITree_AddToNodeData(prevNode, -toAdd);

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_MoveNodeDown
        %
        %   Swap a node with the next one in the same tree level
        %
        function PlotsUITree_MoveNodeDown(app, nodeUid)

            %   return in case of invalid nodeUid
            if ~app.PlotsUITree_IsValidNodeUid(nodeUid)
                return
            end

            %   find node to move down
            [node, parentNode, nodeId] = app.PlotsUITree_FindNode(nodeUid);

            %   not found ? return
            if ~ishandle(node)
                return
            end

            %   no next node ? return
            nodesNum = numel(parentNode.Children);
            if nodeId >= nodesNum
                return
            end

            %   get next node
            nextNode = parentNode.Children(nodeId+1);

            %   swap nodes
            move(node, nextNode, 'after');

            %   swap node labels
            nodeText = node.Text;
            nextNodeText = nextNode.Text;

            node.Text = nextNodeText;
            nextNode.Text = nodeText;

            %   update node data            
            nodeLevel = PlotsUITree_NodeLevel(app, nodeUid);
            
            toAdd = circshift([1, 0, 0], nodeLevel-1);
            app.PlotsUITree_AddToNodeData(node, toAdd);
            app.PlotsUITree_AddToNodeData(nextNode, -toAdd);

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_FindNode
        %
        %   Find node with specified UID
        %
        function [node, parentNode, nodeId] = PlotsUITree_FindNode(app, nodeUid)

            %   return in case of invalid nodeUid
            if ~app.PlotsUITree_IsValidNodeUid(nodeUid)
                return
            end

            %   find parent node
            parentNode = app.PlotsUITree;
            nodeUidLevel = app.PlotsUITree_NodeLevel(nodeUid);            
            for l = 1:nodeUidLevel

                %   children nodes of current parent node
                nodes = parentNode.Children;
                nodesNum = numel(nodes);
                
                %   get nodeId at current tree level
                nodeId = nodeUid(l);

                %   search for node with given id at current tree level
                if nodeId > nodesNum

                    %   no node found ? return
                    node = [];
                    nodeId = [];
                    return

                else

                    %   node found: continue search to next level (if any)
                    node = nodes(nodeId);
                    if l < nodeUidLevel
                        parentNode = node;
                    end
                
                end

            end

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_NodeLabel
        %
        %   Get the node label (text) based on UID
        %
        function label = PlotsUITree_NodeLabel(app, nodeUid)

            %   return in case of invalid nodeUid
            label = "";
            if ~app.PlotsUITree_IsValidNodeUid(nodeUid)
                return
            end

            %   create node label
            nodeLevel = sum(nodeUid ~= 0);
            switch nodeLevel
                case 1, label = sprintf("Plot #%d", nodeUid(1));
                case 2, label = sprintf("Signal #%d", nodeUid(2));
                case 3, label = sprintf("Component #%d", nodeUid(3));    
            end
        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_IsValidNodeUid
        %
        %   Check if a node UID is valid
        %
        function isValid = PlotsUITree_IsValidNodeUid(app, nodeUid)

            %   Valid node UIDs are:
            %   - component node: [p, s, c]
            %   - signal node: [p, s, 0]
            %   - plot node: [p, 0, 0]
            arePosInts = @(x) isnumeric(x) && all(x >= 0) && all(x-floor(x) == 0);
            isPlotNodeUid = @(x) arePosInts(x) && (numel(x) == 3) && (x(1) ~= 0) && (x(2) == 0) && (x(3) == 0);
            isSignalNodeUid = @(x) arePosInts(x) && (numel(x) == 3) && (x(1) ~= 0) && (x(2) ~= 0) && (x(3) == 0);
            isComponentNodeUid = @(x) arePosInts(x) && (numel(x) == 3) && all(x ~= 0);
            isNodeUid = @(x) isPlotNodeUid(x) || isSignalNodeUid(x) || isComponentNodeUid(x);

            %   check if input argument is a valid node UID:
            isValid = isNodeUid(nodeUid);

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_NodeLevel
        %
        %   Return the level of a node in the tree based on its UID
        %
        function nodeLevel = PlotsUITree_NodeLevel(app, nodeUid)
           
            %   return in case of invalid nodeUid
            if ~app.PlotsUITree_IsValidNodeUid(nodeUid)
                return
            end

            %   return node level
            nodeLevel = sum(nodeUid ~= 0);

        end

        % --------------------------------------------------------------- %
        %   PlotsUITree_addToNodeData
        %
        %   Add quantity to NodeData of specified node and all its children
        %
        function PlotsUITree_AddToNodeData(app, node, toAdd)

            childrenNodes = reshape(node.Children, 1, []);
            if ~isempty(node.Children)
                for childrenNode = childrenNodes
                    PlotsUITree_AddToNodeData(app, childrenNode, toAdd);
                end
            end

            node.NodeData = node.NodeData + toAdd;

        end


        %%  UI management - XAxisUITable

        % --------------------------------------------------------------- %
        %   XAxisUITable_Init
        %
        %   Build (empty) XAxisUITable
        %
        function XAxisUITable_Init(app)

            %   init table
            tableLength = 0;
            app.XAxisUITable.Data = table( ...
                'Size', [tableLength, 3], ...
                'VariableNames', {'Plot #', 'Unit', 'Duration'}, ...
                'VariableTypes', {'uint8', 'categorical', 'double'} );

        end

        % --------------------------------------------------------------- %
        %   XAxisUITable_Update_OnPlotsGridChange
        %
        %   Invoked on a change of number of rows/cols in PlotsGrid
        %   - if requested plots are more than current ones, do nothing as 
        %     the new plots nodes added to PlotsUITree are unchecked
        %   - if requested plots are less than current ones, remove all the
        %     rows in XAxisUITable related to plots beyond the requested
        %     number 
        %
        function XAxisUITable_Update_OnPlotsGridChange(app)

            %   get requested number of plots (grid locations)
            plotGridRowsNum = app.PlotGridRowsEditField.Value;
            plotGridColsNum = app.PlotGridColsEditField.Value;
            requestedPlotsNum = plotGridRowsNum * plotGridColsNum;

            %   remove table entries
            availablePlotsList = reshape(app.XAxisUITable.Data.('Plot #'), 1, []);
            toRemovePlotsList = reshape(setdiff(availablePlotsList, 1:requestedPlotsNum), 1, []);

            %   remove entries
            if ~isempty(toRemovePlotsList)
                for p = toRemovePlotsList
                    app.XAxisUITable_DeleteEntry(p);
                end
            end

        end

        % --------------------------------------------------------------- %
        %   XAxisUITable_AddEntry
        %
        %   Add entry (row) to XAxisUITable
        %
        function XAxisUITable_AddEntry(app, plotId)

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end

            %   return if entry is already present
            if ismember(plotId, app.XAxisUITable.Data.("Plot #"))
                return
            end
                
            %   create table entry
            tableToAddLength = 1;
            tableToAdd = table( ...
                'Size', [tableToAddLength, 3], ...
                'VariableNames', {'Plot #', 'Unit', 'Duration'}, ...
                'VariableTypes', {'uint8', 'categorical', 'double'} );

            tableToAdd.('Plot #') = plotId;
            tableToAdd.Unit = categorical(repelem("Time [s]", tableToAddLength, 1), ["Time [s]", "Sample #"]);
            tableToAdd.Duration = repelem(app.defaultParams.plotsDuration, tableToAddLength, 1);

            %   add entry
            app.XAxisUITable.Data = [ ...
                app.XAxisUITable.Data; ...
                tableToAdd];

            %   sort table rows according to plot #
            app.XAxisUITable.Data = sortrows(app.XAxisUITable.Data);

        end

        % --------------------------------------------------------------- %
        %   XAxisUITable_DeleteEntry
        %
        %   Remove entry (row) from XAxisUITable
        %
        function XAxisUITable_DeleteEntry(app, plotId)

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end

            %   return if entry is missing
            if ~ismember(plotId, app.XAxisUITable.Data.("Plot #"))
                return;
            end

            %   find entry position in table
            n = find(app.XAxisUITable.Data.("Plot #") == plotId);

            %   remove entry
            app.XAxisUITable.Data(n,:) = [];

        end


        %%  UI management - YAxisUITable

        % --------------------------------------------------------------- %
        %   YAxisUITable_Init
        %
        %   Build (empty) YAxisUITable
        %
        function YAxisUITable_Init(app)

            %   init table
            tableLength = 0;
            app.YAxisUITable.Data = table( ...
                'Size', [tableLength, 4], ...
                'VariableNames', {'Plot #', 'YMin', 'YMax', 'Auto'}, ...
                'VariableTypes', {'uint8', 'double', 'double', 'logical'} );

        end

        % --------------------------------------------------------------- %
        %   YAxisUITable_Update_onPlotsGridChange
        %
        %   Invoked on a change of number of rows/cols in PlotsGrid
        %   - if requested plots are more than current ones, do nothing as 
        %     the new plots nodes added to PlotsUITree are unchecked
        %   - if requested plots are less than current ones, remove all the
        %     rows in YAxisUITable related to plots beyond the requested
        %     number 
        %
        function YAxisUITable_Update_OnPlotsGridChange(app)

            %   get requested number of plots (grid locations)
            plotGridRowsNum = app.PlotGridRowsEditField.Value;
            plotGridColsNum = app.PlotGridColsEditField.Value;
            requestedPlotsNum = plotGridRowsNum * plotGridColsNum;

            %   remove table entries 
            availablePlotsList = reshape(app.YAxisUITable.Data.('Plot #'), 1, []);
            toRemovePlotsList = reshape(setdiff(availablePlotsList, 1:requestedPlotsNum), 1, []);

            %   remove entries
            if ~isempty(toRemovePlotsList)
                for p = toRemovePlotsList
                    app.YAxisUITable_DeleteEntry(p);
                end
            end

        end

        % --------------------------------------------------------------- %
        %   YAxisUITable_AddEntry
        %
        %   Add entry (row) to YAxisUITable
        %
        function YAxisUITable_AddEntry(app, plotId)
            
            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end

            %   return if entry is already present
            if ismember(plotId, app.YAxisUITable.Data.("Plot #"))
                return;
            end

            %   create table entry
            tableToAddLength = 1;
            tableToAdd = table( ...
                'Size', [tableToAddLength, 4], ...
                'VariableNames', {'Plot #', 'YMin', 'YMax', 'Auto'}, ...
                'VariableTypes', {'uint8', 'double', 'double', 'logical'} );

            tableToAdd.('Plot #') = plotId.';
            tableToAdd.YMin = repelem(NaN, tableToAddLength, 1);
            tableToAdd.YMax = repelem(NaN, tableToAddLength, 1);
            tableToAdd.Auto = repelem(true, tableToAddLength, 1);

            %   add table entry
            app.YAxisUITable.Data = [ ...
                app.YAxisUITable.Data; ...
                tableToAdd];

            %   sort table rows according to plot #
            app.YAxisUITable.Data = sortrows(app.YAxisUITable.Data);

        end

        % --------------------------------------------------------------- %
        %   YAxisUITable_DeleteEntry
        %
        %   Remove entry (row) from YAxisUITable
        %
        function YAxisUITable_DeleteEntry(app, plotId)

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end
            
            %   return if entry is missing
            if ~ismember(plotId, app.YAxisUITable.Data.("Plot #"))
                return;
            end

            %   find entry position in table
            n = find(app.YAxisUITable.Data.("Plot #") == plotId);

            %   remove entry
            app.YAxisUITable.Data(n,:) = [];

        end


        %%  UI management - PlotsGrid

        % --------------------------------------------------------------- %
        %   PlotsGrid_Init
        %
        %   Initialize the plots grid and axes
        %
        function PlotsGrid_Init(app)

            %   get number of plots (grid locations)
            plotGridRowsNum = app.PlotGridRowsEditField.Value;
            plotGridColsNum = app.PlotGridColsEditField.Value;
            plotsNum = plotGridRowsNum * plotGridColsNum;

            %   initialize array of uiAxes
            app.uiAxes = createArray(plotsNum, 1, 'matlab.ui.control.UIAxes');

            %   uninitialize axes
            delete(app.uiAxes);

            %   initialize grid layout
            app.PlotsPanelGridLayout.RowHeight = repelem("1x", 1, plotGridRowsNum);
            app.PlotsPanelGridLayout.ColumnWidth = repelem("1x", 1, plotGridColsNum);

        end

        % --------------------------------------------------------------- %
        %   PlotsGrid_Update_onPlotsGridChange
        %
        %   Invoked on a change of number of rows/cols in PlotsGrid
        %   - if requested plots are more than current ones, only rearrange
        %     the existing axes in the new grid layout, as the new plots 
        %     added to the PlotsUITree are unchecked
        %   - if the are less than current ones:
        %     - remove all the axes related to plots beyond the requested number
        %     - rearrange remaining plots in the new grid layout
        %
        function PlotsGrid_Update_OnPlotsGridChange(app)

            %   get requested number of plots (grid locations)
            plotGridRowsNum = app.PlotGridRowsEditField.Value;
            plotGridColsNum = app.PlotGridColsEditField.Value;
            requestedPlotsNum = plotGridRowsNum * plotGridColsNum;

            %   get current number of plots (grid locations)
            currentPlotsNum = numel(app.uiAxes);

            %   resize uiAxes array
            if requestedPlotsNum > currentPlotsNum

                %   extra plots are requested:
                %   - add extra elements to uiAxes array   

                %   initialize array of uiAxes to add
                uiAxesToAddNum = requestedPlotsNum - currentPlotsNum;
                extraUIAxes = createArray(uiAxesToAddNum, 1, 'matlab.ui.control.UIAxes');

                %   uninitialize extra axes
                delete(extraUIAxes);

                %   add extra axes handles to uiAxes array
                app.uiAxes = [ ...
                    app.uiAxes; ...
                    extraUIAxes ];

            else

                %   the requested plots are less than current ones:
                %   - remove extra elements from uiAxes array

                %   remove extra axes
                delete(app.uiAxes(requestedPlotsNum+1:currentPlotsNum));
                app.uiAxes(requestedPlotsNum+1:currentPlotsNum) = [];

            end

            %   update grid layout
            app.PlotsPanelGridLayout.RowHeight = repelem("1x", 1, plotGridRowsNum);
            app.PlotsPanelGridLayout.ColumnWidth = repelem("1x", 1, plotGridColsNum);

            %   rearrange existing axes in the new grid layout            
            toMovePlotsList = reshape(find(ishandle(app.uiAxes)), 1, []);
            if ~isempty(toMovePlotsList)
                for p = toMovePlotsList

                    %   obtain plot location
                    n = floor((p-1)/plotGridColsNum) + 1;
                    m = rem(p-1, plotGridColsNum) + 1;

                    %   set new position
                    app.uiAxes(p).Layout.Row = n;
                    app.uiAxes(p).Layout.Column = m;

                end
            end

        end


        %%  UI management - Plots 

        % --------------------------------------------------------------- %
        %   Plots_AddAxes
        %
        %   Add axes to grid
        %
        function Plots_AddAxes(app, plotId)

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end

            %   return if axes are already present
            if ishandle(app.uiAxes(plotId))
                return;
            end

            %   create new axes
            app.uiAxes(plotId) = uiaxes(app.PlotsPanelGridLayout);

            %   obtain plot location
            plotGridColsNum = app.PlotGridColsEditField.Value;
            n = floor((plotId-1)/plotGridColsNum) + 1;
            m = rem(plotId-1, plotGridColsNum) + 1;

            %   set axes position on grid
            app.uiAxes(plotId).Layout.Row = n;
            app.uiAxes(plotId).Layout.Column = m;

            %   set x-axis limit mode
            app.uiAxes(plotId).XLimMode = 'manual';

            %   turn box on
            app.uiAxes(plotId).Box = "on";

            %   add x-axis label
            if app.XAxisUITable.Data.Unit(plotId) == "Sample #"
                app.uiAxes(plotId).XLabel.String = "Sample #";
            else
                app.uiAxes(plotId).XLabel.String = "Time [s]";
            end

            %   add y-axis label
            app.uiAxes(plotId).YLabel.String = sprintf("(%d)", plotId);

            %   set color map
            colororder(app.uiAxes(plotId), "gem12");

            %   init user data
            app.uiAxes(plotId).UserData = struct( ...
                "signalUid", double.empty(0,3), ...
                "animatedLineObj", []);

            %   assign context menu to axes
            app.uiAxes(plotId).ContextMenu = app.Plots_ContextMenu;

            %   set callback function to store axes object
            %   in the context menu when the button is pressed
            set(app.uiAxes(plotId), 'ButtonDownFcn', ...
                @(src,evt) set(app.uiAxes(plotId).ContextMenu, 'UserData', app.uiAxes(plotId)));

        end

        % --------------------------------------------------------------- %
        %   Plots_DeleteAxes
        %
        %   Remove plot from grid  
        %
        function Plots_DeleteAxes(app, plotId)

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end

            %   return if axes are not present
            if ~ishandle(app.uiAxes(plotId))
                return;
            end

            %   delete axes
            delete(app.uiAxes(plotId));

        end

        % --------------------------------------------------------------- %
        %   Plots_SetDuration
        %
        %   Set plot duration (number of animatedlines points) 
        %
        function Plots_SetDuration(app, plotId)

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end

            %   return if no axes are present
            if ~ishandle(app.uiAxes(plotId))
                return
            end

            %   get duration
            p = find(app.XAxisUITable.Data.('Plot #') == plotId);
            duration = app.XAxisUITable.Data.Duration(p);

            %   get number of points for animatedlines
            if app.XAxisUITable.Data.Unit(p) == "Sample #"
                animatedLinesNumPts = duration;
            else
                Ts = app.TxSampleTimeEditField.Value;
                animatedLinesNumPts = ceil(duration/Ts);
            end

            %   limit number of points to log buffer size
            if animatedLinesNumPts > app.logBuffer.size
                animatedLinesNumPts = app.logBuffer.size;
            end

            %   set number of points of animatedlines 
            animatedLineObj = app.uiAxes(plotId).UserData.animatedLineObj;
            animatedLineObjNum = length(animatedLineObj);
            for l = 1:animatedLineObjNum
                animatedLineObj(l).MaximumNumPoints = animatedLinesNumPts;
            end

        end
        
        % --------------------------------------------------------------- %
        %   Plots_ChangeXAxisUnit
        %
        %   Change plot x-axis unit ("Sample #" or "Time [s]")
        %
        function Plots_ChangeXAxisUnit(app, plotId)

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end

            %   return if no axes are present
            if ~ishandle(app.uiAxes(plotId))
                return
            end

            %   get unit
            p = find(app.XAxisUITable.Data.('Plot #') == plotId);
            xUnit = app.XAxisUITable.Data.Unit(p);

            %   change x-axis unit
            animatedLineObj = app.uiAxes(plotId).UserData.animatedLineObj;
            animatedLineObjNum = numel(animatedLineObj);

            if xUnit == "Sample #"
                %   change from "Time [s]" to "Sample #"
                
                %   update x-values of animatedlines points
                for l = 1:animatedLineObjNum
                    [x, y] = getpoints(animatedLineObj(l));
                    samplesNum = numel(x);
                    x = app.logBuffer.sampleIndex(end-samplesNum+1:end);
                    clearpoints(animatedLineObj(l));
                    addpoints(animatedLineObj(l), x, y);
                end

                %   update x-axis label
                app.uiAxes(plotId).XLabel.String = "Sample #";

            else
                %   change from "Sample #" to "Time [s]"

                %   update x-values of animatedlines points
                for l = 1:animatedLineObjNum
                    [x, y] = getpoints(animatedLineObj(l));
                    samplesNum = numel(x);
                    x = app.logBuffer.time(end-samplesNum+1:end);
                    clearpoints(animatedLineObj(l));
                    addpoints(animatedLineObj(l), x, y);
                end

                %   update x-axis label
                app.uiAxes(plotId).XLabel.String = "Time [s]";

            end

        end

        % --------------------------------------------------------------- %
        %   Plots_SetXAxisRange
        %
        %   Set plot x-axis range
        %
        function Plots_SetXAxisRange(app, plotId)

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end

            %   return if no axes are present
            if ~ishandle(app.uiAxes(plotId))
                return
            end

            %   get x-axis unit and duration
            p = find(app.XAxisUITable.Data.('Plot #') == plotId);
            xUnit = app.XAxisUITable.Data.Unit(p);
            duration = app.XAxisUITable.Data.Duration(p);

            %   set x-axis limits
            if xUnit == "Sample #"
                if app.logLastSampleIndex > duration
                    app.uiAxes(plotId).XLim = app.logLastSampleIndex + [-duration, 0];
                else
                    app.uiAxes(plotId).XLim = [0, duration];
                end
            else
                if app.logLastTimeInstant > duration
                    app.uiAxes(plotId).XLim = app.logLastTimeInstant + [-duration, 0];
                else
                    app.uiAxes(plotId).XLim = [0, duration];
                end
            end

        end
        
        % --------------------------------------------------------------- %
        %   Plots_SetYAxisRange
        %
        %   Set plot y-axis range
        %
        function Plots_SetYAxisRange(app, plotId)

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end

            %   return if no axes are present
            if ~ishandle(app.uiAxes(plotId))
                return
            end

            %   get y-axis limits and scaling mode
            p = find(app.YAxisUITable.Data.('Plot #') == plotId);
            YLim = [app.YAxisUITable.Data.YMin(p), app.YAxisUITable.Data.YMax(p)];
            autoScale = app.YAxisUITable.Data.Auto(p);

            %   set y-axis limits
            if autoScale
                set(app.uiAxes(plotId), 'YLimMode', 'auto');
            else
                set(app.uiAxes(plotId), 'YLimMode', 'manual');
                app.uiAxes(plotId).YLim = YLim;
            end

        end

        % --------------------------------------------------------------- %
        %   Plots_AddSignal
        %
        %   Add signal with specified UID to plot
        %
        function Plots_AddSignal(app, signalUid)

            %   return in case of invalid signalUid
            if ~app.Plots_IsValidSignalUid(signalUid)
                return
            end

            %   return in case of invalid plotId
            plotId = signalUid(1);
            plotsNum = numel(app.uiAxes);
            if plotId > plotsNum
                return
            end
            
            %   return in case of invalid signalId
            signalId = signalUid(2);
            signalsNum = height(app.PacketStructUITable.Data);
            if ~ismember(signalId, 1:signalsNum)
                return
            end

            %   return in case of invalid componentId            
            componentId = signalUid(3);
            componentsNum = app.PacketStructUITable.Data.Dimension(signalId);
            if componentId>0 && ~ismember(componentId, 1:componentsNum)
                return
            end

            %   if plot axes are not present:
            %   - add plot entry in XAxisUITable
            %   - add plot entry in YAxisUITable
            %   - add axes
            %   - set axes ranges
            if ~ishandle(app.uiAxes(plotId))
                app.XAxisUITable_AddEntry(plotId);
                app.YAxisUITable_AddEntry(plotId);
                app.Plots_AddAxes(plotId);
                app.Plots_SetXAxisRange(plotId);
                app.Plots_SetYAxisRange(plotId);
            end

            %   add signal (if not present yet)
            if componentId == 0
                toAddComponentIdList = 1:componentsNum;
            else
                toAddComponentIdList = componentId;
            end

            for c = toAddComponentIdList
                toAddSignalUid = [plotId, signalId, c];
                if ~ismember(toAddSignalUid, app.uiAxes(plotId).UserData.signalUid, 'rows')

                    %   add signal uid to axes UserData
                    app.uiAxes(plotId).UserData.signalUid = [ ...
                        app.uiAxes(plotId).UserData.signalUid; ...
                        toAddSignalUid ];

                    %   create animatedline object
                    al = animatedline(app.uiAxes(plotId));
                    app.uiAxes(plotId).UserData.animatedLineObj = [ ...
                        app.uiAxes(plotId).UserData.animatedLineObj; ...
                        al ];

                    %   initialize animatedline object
                    p = find(app.XAxisUITable.Data.('Plot #') == plotId);
                    if app.XAxisUITable.Data.Unit(p) == "Sample #"
                        animatedLinesNumPts = app.XAxisUITable.Data.Duration(p);
                    else
                        Ts = app.TxSampleTimeEditField.Value;
                        animatedLinesNumPts = ceil(app.XAxisUITable.Data.Duration(p)/Ts);
                    end

                    %   limit number of points to log buffer size
                    if animatedLinesNumPts > app.logBuffer.size
                        animatedLinesNumPts = app.logBuffer.size;
                    end

                    %   define line color
                    colorNums = numel(app.uiAxes(plotId).ColorOrder);
                    colorIdx = rem(size(app.uiAxes(plotId).UserData.signalUid,1), colorNums);
                    if colorIdx == 0, colorIdx = 3; end
                    color = app.uiAxes(plotId).ColorOrder(colorIdx,:);

                    %   set animatedline properties
                    set(al, ...
                        'Color', color, ...
                        'LineStyle', '-', ...
                        'Marker', '.', ...
                        'DisplayName', sprintf('%d.%d', signalId, c), ...
                        'MaximumNumPoints', animatedLinesNumPts);

                    %   assign context menu to animatedline
                    al.ContextMenu = app.Signals_ContextMenu;

                    %   set callback function to store animatedline object
                    %   in the context menu when the button is pressed
                    set(al, 'ButtonDownFcn', ...
                        @(src,evt) set(al.ContextMenu, 'UserData', src));

                end
            end
            
        end

        % --------------------------------------------------------------- %
        %   Plots_DeleteSignal
        %
        %   Delete signal with specified UID from plot
        %
        function Plots_DeleteSignal(app, signalUid)

            %   return in case of invalid signalUid
            if ~app.Plots_IsValidSignalUid(signalUid)
                return
            end

            %   return in case of invalid plotId
            plotsNum = numel(app.uiAxes);
            plotId = signalUid(1);
            if plotId > plotsNum
                return
            end

            %   return if axes are not present
            if ~ishandle(app.uiAxes(plotId))
                return
            end

            %   remove signals and related user data
            signalUidList = app.uiAxes(plotId).UserData.signalUid;
            if signalUid(3) == 0
                toRemoveSignalsIdxs = find(ismember(signalUidList(1:2), signalUid(1:2), "rows"));
            else
                toRemoveSignalsIdxs = find(ismember(signalUidList, signalUid, "rows"));
            end

            if ~isempty(toRemoveSignalsIdxs)
                for k = toRemoveSignalsIdxs
                    delete(app.uiAxes(plotId).UserData.animatedLineObj(k));
                    app.uiAxes(plotId).UserData.signalUid(k,:) = [];
                    app.uiAxes(plotId).UserData.animatedLineObj(k) = [];
                end
            end

            %   if all signals have been removed from plot:
            %   - delete plot entry in XAxisUITable
            %   - delete plot entry in YAxisUITable
            %   - delete axes
            if isempty(app.uiAxes(plotId).UserData.animatedLineObj)
                app.XAxisUITable_DeleteEntry(plotId);
                app.YAxisUITable_DeleteEntry(plotId);
                app.Plots_DeleteAxes(plotId);
            end

        end

        % --------------------------------------------------------------- %
        %   Plots_IsValidSignalUid
        %
        %   Check if a signal UID is valid
        %
        function isValid = Plots_IsValidSignalUid(app, signalUid)

            %   Valid signal UIDs are:
            %   - signal-component pair UID: [p, s, c]
            %   - signal-with-all-its-components UID: [p, s, 0]
            arePosInts = @(x) isnumeric(x) && all(x >= 0) && all(x-floor(x) == 0);
            isSignalWithAllComponentsUid = @(x) arePosInts(x) && (numel(x) == 3) && (x(1) ~= 0) && (x(2) ~= 0) && (x(3) == 0);
            isSignalWithComponentUid = @(x) arePosInts(x) && (numel(x) == 3) && all(x ~= 0);

            %   check if input argument is a valid signal UID:
            isValid = isSignalWithAllComponentsUid(signalUid) || isSignalWithComponentUid(signalUid);

        end


    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, varargin)

            %   get configuration params
            try
                app.cfgParams = app.AppConfig_ParseInputArgs(varargin{:});
            catch ME
                delete(app);    
                rethrow(ME);
            end

            %   init UI elements (app.ConnectionTab)
            app.LocalUDPPortEditField.Value = app.cfgParams.localUdpPort;

            app.StartStopCmdCheckBox.Value = app.cfgParams.enableStartStopCmds;
            app.StartStopCmdPanel.Visible = app.cfgParams.enableStartStopCmds;
            app.RemoteUdpPortEditField.Value = app.cfgParams.remoteUdpPort;
            app.RemoteIpAddressEditField.Value = app.cfgParams.remoteIpAddress;
            
            app.StartByteEditField.Value = app.cfgParams.txStartCmd;
            app.StopByteEditField.Value = app.cfgParams.txStopCmd;

            %   init UI elements (app.PacketTab)
            app.PacketStructUITable_Init(app.cfgParams.packetSpec);
            app.Packet_UpdateInfoStruct();

            app.COBSEncodedCheckBox.Value = app.cfgParams.enableCOBS;
            app.NullTermCheckBox.Value = app.cfgParams.enableNullTerminator;

            %   init UI elements (app.LogTab)  
            app.BufferSizeEditField.Value = app.cfgParams.bufferSize;
            app.TxSampleTimeEditField.Value = app.cfgParams.txSampleTime;
            app.LogToWorkspaceCheckBox.Value = app.cfgParams.enableLogToWorkspace;
            app.LogToWorkspacePanel.Visible = app.cfgParams.enableLogToWorkspace;
            app.VarNameEditField.Value = "data";
            app.SaveToWorkspaceOnExitCheckBox.Value = app.cfgParams.enableSaveOnExit;

            %   init last log time instant / sample index
            app.logLastSampleIndex = 0;
            app.logLastTimeInstant = 0;

            %   init log buffers
            logBufferSize = app.cfgParams.bufferSize;
            app.BufferSizeEditField.Value = logBufferSize;
            app.logBuffer = struct( ...
                "sampleIndex", NaN*ones(1, logBufferSize), ...
                "time", NaN*ones(1, logBufferSize), ...
                "signals", {cell(app.packetInfo.cellsNum, 1)}, ...
                "size", logBufferSize, ...
                "tailPos", 1);

            logTempBufferSize =  app.cfgParams.plotsRefreshRatio;
            app.RefreshRatioEditField.Value = logTempBufferSize;
            app.logTempBuffer = struct( ...
                "sampleIndex", NaN*ones(1, logTempBufferSize), ...
                "time", NaN*ones(1, logTempBufferSize), ...
                "signals", {cell(app.packetInfo.cellsNum, 1)}, ...
                "size", logTempBufferSize, ...
                "tailPos", 1);

            for n = 1:app.packetInfo.cellsNum
                app.logBuffer.signals{n} = NaN*ones(app.packetInfo.cellWidth(n), logBufferSize);
                app.logTempBuffer.signals{n} = NaN*ones(app.packetInfo.cellWidth(n), logTempBufferSize);
            end   

            %   init UI elements (app.PlotsTab)
            app.PlotGridRowsEditField.Value = app.cfgParams.plotsGridSize(1);
            app.PlotGridColsEditField.Value = app.cfgParams.plotsGridSize(2);
            app.PlotsGrid_Init();
            
            app.XAxisUITable_Init();
            app.YAxisUITable_Init();
            app.PlotsUITree_Init();
            app.RefreshRatioEditField.Value = app.cfgParams.plotsRefreshRatio;

        end

        % Value changed function: ConnectSwitch
        function ConnectSwitch_ValueChanged(app, event)

            if strcmp(app.ConnectSwitch.Value, "On")    
 
                %    connect to UDP port
                app.UdpPort_Connect();

            else   
                
                %    disconnect from UDP port
                app.UdpPort_Disconnect();
                
            end

        end

        % Value changed function: PlotGridRowsEditField
        function PlotsGridRowsEditField_ValueChanged(app, event)

            %   update PlotsUITree
            %   - add/remove plots entries in PlotsUITree
            app.PlotsUITree_Update_OnPlotsGridChange();

            %   update XAxisUITable
            %   - remove entries not related to any plot
            app.XAxisUITable_Update_OnPlotsGridChange();

            %   update YAxisUITable
            %   - remove entries not related to any plot
            app.YAxisUITable_Update_OnPlotsGridChange();

            %   update PlotsGridLayout
            %   - remove plots that are removed from the PlotsUITree
            %   - rearrange existing plots in the new grid 
            app.PlotsGrid_Update_OnPlotsGridChange();
            
        end

        % Value changed function: PlotGridColsEditField
        function PlotsGridColsEditField_ValueChanged(app, event)

            %   update PlotsUITree
            %   - add/remove plots entries in PlotsUITree
            app.PlotsUITree_Update_OnPlotsGridChange();

            %   update XAxisUITable
            %   - remove entries not related to any plot
            app.XAxisUITable_Update_OnPlotsGridChange();

            %   update YAxisUITable
            %   - only remove plots that are removed from the PlotsUITree
            app.YAxisUITable_Update_OnPlotsGridChange();

            %   update PlotsGridLayout
            %   - remove plots that are removed from the PlotsUITree
            %   - rearrange existing plots in the new grid
            app.PlotsGrid_Update_OnPlotsGridChange();

        end

        % Menu selected function: PacketStructUITable_AddRowMenu
        function PacketStructUITable_AddRowMenuSelected(app, event)
            
            %   return if user right-clicked outside PacketStructUITable
            if event.ContextObject ~= app.PacketStructUITable
                return
            end

            %   return if PacketStructUITable is not empty, but user did
            %   not select any row
            rowsNum = height(app.PacketStructUITable.Data);
            if rowsNum > 0 && isempty(event.InteractionInformation.DisplayRow)
                return
            end

            %   add entries to PacketStructUITable and PlotsUITree
            if rowsNum > 0
                
                %   if PacketStructUITable is not empty:
                %   - add row above selected row
                %   - renumber all the following signals
                selectedRow = event.InteractionInformation.DisplayRow;
                app.PacketStructUITable_AddRow(selectedRow);

                %   Note: in the added row 
                %   - the signal type is still undefined
                %   - the signal dimension is one

                %   in PlotsUITree:
                %   - in each plot node, add signal node above selected one
                %   - rename all the following signal nodes
                plotNodesNum = numel(app.PlotsUITree.Children);
                s = selectedRow;
                for p = 1:plotNodesNum
                    app.PlotsUITree_AddNode([p, s, 0]);
                    app.PlotsUITree_AddNode([p, s, 1]);
                end

                %   in uiAxes:
                %   - for all the renumbered signals, update id in UserData
                plotsNum = numel(app.uiAxes);
                for p = 1:plotsNum
                    if ishandle(app.uiAxes(p))
                        k = find(app.uiAxes(p).UserData.signalUid(:,2) >= selectedRow);
                        app.uiAxes(p).UserData.signalUid(k,2) = app.uiAxes(p).UserData.signalUid(k,2) + 1;
                    end
                end

                %   in log buffers:
                %   - for all the renumbered signals, shift positions in log buffers
                %   - for the added signal, add a row vector with NaN
                app.logBuffer.signals = [ ...
                    app.logBuffer.signals(1:selectedRow-1); ...
                    cell(1,1); ...
                    app.logBuffer.signals(selectedRow:end) ];

                app.logTempBuffer.signals = [ ...
                    app.logTempBuffer.signals(1:selectedRow-1); ...
                    cell(1,1); ...
                    app.logTempBuffer.signals(selectedRow:end) ];

                app.logBuffer.signals{selectedRow} = NaN*ones(1, app.logBuffer.size);
                app.logTempBuffer.signals{selectedRow} = NaN*ones(1, app.logTempBuffer.size);

            else

                %   if PacketStructUITable is empty:
                %   - append new row at the end of the table
                app.PacketStructUITable_AppendRow();

                %   Note: in the added row
                %   - the signal type is still undefined
                %   - the signal dimension is one

                %   in PlotsUITree:
                %   - append new signal node to each plot node
                plotNodesNum = numel(app.PlotsUITree.Children);
                for p = 1:plotNodesNum
                    app.PlotsUITree_AddNode([p, 1, 1]);
                end

                %   in log buffers:
                %   - for the added signal, add a row vector with NaN
                app.logBuffer.signals = cell(1,1);
                app.logTempBuffer.signals = cell(1,1);

                app.logBuffer.signals{1} = NaN*ones(1, app.logBuffer.size);
                app.logTempBuffer.signals{1} = NaN*ones(1, app.logTempBuffer.size);

            end


        end

        % Menu selected function: PacketStructUITable_DeleteRowMenu
        function PacketStructUITable_DeleteRowMenuSelected(app, event)
            
            %   return if user right-clicked outside PacketStructUITable
            if event.ContextObject ~= app.PacketStructUITable
                return
            end

            %   return if user did not select any row
            if isempty(event.InteractionInformation.DisplayRow)
                return
            end

            %   in PacketStructUITable:
            %   - remove selected row
            %   - renumber all the following signals
            selectedRow = event.InteractionInformation.DisplayRow;
            app.PacketStructUITable_DeleteRow(selectedRow);

            %   in PlotsUITree:
            %   - remove node of selected signal
            %   - renumber all the following signals
            plotNodesNum = numel(app.PlotsUITree.Children);
            s = selectedRow;
            for p = 1:plotNodesNum
                app.PlotsUITree_DeleteNode([p, s, 0]);
            end

            %   in uiAxes:
            %   - if the signal is shown, remove it from plots
            plotsNum = numel(app.uiAxes);
            for p = 1:plotsNum
                app.Plots_DeleteSignal([p, s, 0]);
            end

            %   in log buffers:
            %   - remove the entry of the deleted signal
            %   - for all the renumbered signals, shift positions in log buffers
            app.logBuffer.signals = [ ...
                app.logBuffer.signals(1:s-1); ...
                app.logBuffer.signals(s+1:end) ];

            app.logTempBuffer.signals = [ ...
                app.logTempBuffer.signals(1:s-1); ...
                app.logTempBuffer.signals(s+1:end) ];

        end

        % Menu selected function: PacketStructUITable_MoveUpMenu
        function PacketStructUITable_MoveUpMenuSelected(app, event)

            %   return if user right-clicked outside PacketStructUITable
            if event.ContextObject ~= app.PacketStructUITable
                return
            end

            %   return if user did not select any row
            if isempty(event.InteractionInformation.DisplayRow)
                return
            end

            %   return if selected row is the first in the table
            if event.InteractionInformation.DisplayRow <= 1
                return
            end

            %   in PacketStructUITable:
            %   - move selected row up
            %   - swap numbers of selected signal and previous one
            selectedRow = event.InteractionInformation.DisplayRow;
            app.PacketStructUITable_MoveRowUp(selectedRow);

            %   set signalId of signal to move    
            signalId = selectedRow;

            %   in PlotsUITree:
            %   - for each plot node, swap selected signal node with previous one
            %   - update the information stored in NodeData of leaf nodes
            plotNodesNum = numel(app.PlotsUITree.Children);
            for p = 1:plotNodesNum
                app.PlotsUITree_MoveNodeUp([p, signalId, 0]);
            end

            %   in uiAxes:
            %   - swap ids of selected signal and previous one
            plotsNum = numel(app.uiAxes);
            for p = 1:plotsNum
                if ishandle(app.uiAxes(p))

                    %   - decrease the id of selected signal by one
                    %   - increase the id of preceding signal by one
                    kToDec = find(app.uiAxes(p).UserData.signalUid(:,2) == signalId);
                    kToInc = find(app.uiAxes(p).UserData.signalUid(:,2) == signalId-1);

                    app.uiAxes(p).UserData.signalUid(kToDec,2) = app.uiAxes(p).UserData.signalUid(kToDec,2) - 1;
                    app.uiAxes(p).UserData.signalUid(kToInc,2) = app.uiAxes(p).UserData.signalUid(kToInc,2) + 1;

                end
            end

            %   in log buffers:
            %   - swap selected signal and previous one in log buffers
            aux = app.logBuffer.signals(signalId-1);
            app.logBuffer.signals(signalId-1) = app.logBuffer.signals(signalId);
            app.logBuffer.signals(signalId) = aux;

            aux = app.logTempBuffer.signals(signalId-1);
            app.logTempBuffer.signals(signalId-1) = app.logTempBuffer.signals(signalId);
            app.logTempBuffer.signals(signalId) = aux;
            
        end

        % Menu selected function: PacketStructUITable_MoveDownMenu
        function PacketStructUITable_MoveDownMenuSelected(app, event)
            
            %   return if user right-clicked outside PacketStructUITable
            if event.ContextObject ~= app.PacketStructUITable
                return
            end

            %   return if user did not select any row
            if isempty(event.InteractionInformation.DisplayRow)
                return
            end

            %   return if selected row is the last in the table
            signalsNum = height(app.PacketStructUITable.Data);
            if event.InteractionInformation.DisplayRow >= signalsNum
                return
            end

            %   in PacketStructUITable:
            %   - move selected row down
            %   - swap numbers of selected signal and next one
            selectedRow = event.InteractionInformation.DisplayRow;
            app.PacketStructUITable_MoveRowDown(selectedRow);

            %   set signalId of signal to move    
            signalId = selectedRow;  

            %   in PlotsUITree:
            %   - for each plot node, swap selected signal node with next one
            %   - update the information stored in NodeData of leaf nodes
            plotNodesNum = numel(app.PlotsUITree.Children);
            for p = 1:plotNodesNum
                app.PlotsUITree_MoveNodeDown([p, signalId, 0]);
            end

            %   in uiAxes:
            %   - swap ids of selected signal and next one
            plotsNum = numel(app.uiAxes);
            for p = 1:plotsNum
                if ishandle(app.uiAxes(p))

                    %   - increase the id of selected signal by one
                    %   - decrease the id of next signal by one
                    kToInc = find(app.uiAxes(p).UserData.signalUid(:,2) == signalId);
                    kToDec = find(app.uiAxes(p).UserData.signalUid(:,2) == signalId+1);

                    app.uiAxes(p).UserData.signalUid(kToInc,2) = app.uiAxes(p).UserData.signalUid(kToInc,2) + 1;
                    app.uiAxes(p).UserData.signalUid(kToDec,2) = app.uiAxes(p).UserData.signalUid(kToDec,2) - 1;

                end
            end

            %   in log buffers:
            %   - swap selected signal and next one in log buffers
            aux = app.logBuffer.signals(signalId+1);
            app.logBuffer.signals(signalId+1) = app.logBuffer.signals(signalId);
            app.logBuffer.signals(signalId) = aux;

            aux = app.logTempBuffer.signals(signalId+1);
            app.logTempBuffer.signals(signalId+1) = app.logTempBuffer.signals(signalId);
            app.logTempBuffer.signals(signalId) = aux;

        end

        % Cell edit callback: PacketStructUITable
        function PacketStructUITable_CellEdit(app, event)

            %   return if nothing has been changed in table
            indices = event.Indices;
            previousData = event.PreviousData;
            newData = event.NewData;
            if newData == previousData
                return
            end

            %   get position of modified cell 
            cellRow = indices(1);
            cellCol = indices(2);

            %   in case of "Signal Type" change:
            %   - do nothing, as data type does not affect any UI part
            if cellCol <= 2
                return
            end

            %   in case of "Dimension" change:
            if cellCol == 3
                
                signalId = cellRow;
                previousSignalDim = previousData;
                currentSignalDim = newData;
                    
                %   check if dimension is valid
                if ~ismember(currentSignalDim, 1:app.maxComponentsNum)
                    errordlg( ...
                        sprintf("Invalid signal dimension (must be a positive integer less than %d)", app.maxComponentsNum), ...
                        'Error', 'modal');
                    app.PacketStructUITable.Data{cellRow, cellCol} = previousSignalDim;
                    return
                end

                %   in PlotsUITree:
                %   - add/remove components to specified signal
                %   - if a component node to be removed is checked, delete 
                %   the signal from the corresponding plot
                plotNodesNum = numel(app.PlotsUITree.Children);
                if currentSignalDim > previousSignalDim

                    %   extra components are added to specified signal:
                    %   - add extra component nodes to PlotsUITree
                    for p = 1:plotNodesNum
                        for c = previousSignalDim+1:currentSignalDim
                            app.PlotsUITree_AddNode([p, signalId, c]);
                        end
                    end

                else

                    %   some components are removed from specified signal:
                    %   - remove component nodes from PlotsUITree
                    for p = 1:plotNodesNum
                        for c = previousSignalDim:-1:(currentSignalDim+1)

                            %   delete component node
                            app.PlotsUITree_DeleteNode([p, signalId, c]);
                            
                            %   delete signal (if present) on plot
                            app.Plots_DeleteSignal([p, signalId, c]);

                        end
                    end

                end

                %   in log buffer:
                %   - update the number of components of specified signal
                if currentSignalDim > previousSignalDim

                    %   extra components are added to specified signal:
                    %   - add extra rows to log buffers
                    
                    range = previousSignalDim+1:currentSignalDim;
                    toAddRowsNum = numel(range);

                    logBufferSize = app.BufferSizeEditField.Value;
                    app.logBuffer.signals{signalId}(range,:) =  NaN*ones(toAddRowsNum, logBufferSize);

                    logTempBufferSize =  app.RefreshRatioEditField.Value;
                    app.logTempBuffer.signals{signalId}(range,:) =  NaN*ones(toAddRowsNum, logTempBufferSize);

                else

                    %   some components are removed from specified signal:
                    %   - remove extra rows from log buffers

                    range = currentSignalDim+1:previousSignalDim;
      
                    app.logBuffer.signals{signalId}(range,:) = [];
                    app.logTempBuffer.signals{signalId}(range,:) = [];

                end
             
            end
 
        end

        % Callback function: PlotsUITree
        function PlotsUITree_CheckedNodesChanged(app, event)
                        
            %   find checked signals in PlotsUITree
            checkedLeafs = event.LeafCheckedNodes;
            checkedSignalsList = cell2mat( arrayfun(@(x) x.NodeData, checkedLeafs, 'UniformOutput', false) );
            if isempty(checkedSignalsList)
                checkedSignalsList = double.empty(0,3);
            end

            %   find previously checked signals in PlotsUITree
            previousCheckedLeafs = event.PreviousLeafCheckedNodes;
            previousCheckedSignalsList = cell2mat( arrayfun(@(x) x.NodeData, previousCheckedLeafs, 'UniformOutput', false) );
            if isempty(previousCheckedSignalsList)
                previousCheckedSignalsList = double.empty(0,3);
            end

            %   find signals to add/remove
            toAddSignalsList = setdiff(checkedSignalsList, previousCheckedSignalsList, 'rows');
            toRemoveSignalsList = setdiff(previousCheckedSignalsList, checkedSignalsList, 'rows');

            %   add signals
            [signalsNum, ~] = size(toAddSignalsList);
            for s = 1:signalsNum
                signalUid = toAddSignalsList(s,:);
                app.Plots_AddSignal(signalUid);
            end

            %   remove signals
            [signalsNum, ~] = size(toRemoveSignalsList);
            for s = 1:signalsNum
                signalUid = toRemoveSignalsList(s,:);
                app.Plots_DeleteSignal(signalUid);
            end

        end

        % Cell edit callback: XAxisUITable
        function XAxisUITable_CellEdit(app, event)

            %   return if nothing has been changed in table
            indices = event.Indices;
            previousData = event.PreviousData;
            newData = event.NewData;
            if newData == previousData
                return
            end

            %   extract info from table entry
            cellRow = indices(1);
            cellCol = indices(2);
            plotId = app.XAxisUITable.Data{cellRow,1};
            xUnit = app.XAxisUITable.Data{cellRow,2};
            duration = app.XAxisUITable.Data{cellRow,3};

            %   get Tx sample time
            Ts = app.TxSampleTimeEditField.Value;

            %   in case of "Unit" change:
            %   - change duration value in table
            %   - change x-axis unit
            %   - set x-axis range
            if cellCol == 2

                %   modify duration value in table
                if xUnit == "Sample #"
                    duration = ceil(duration/Ts);
                else
                    duration = duration*Ts;
                end
                app.XAxisUITable.Data{cellRow,3} = duration;

                %   modify plot
                app.Plots_ChangeXAxisUnit(plotId);
                app.Plots_SetXAxisRange(plotId);

            end

            %   in case of "Duration" change:
            %   - modify duration of selected plot
            %   - set x-axis range
            if cellCol == 3
                app.Plots_SetDuration(plotId);
                app.Plots_SetXAxisRange(plotId);
            end

        end

        % Cell edit callback: YAxisUITable
        function YAxisUITable_CellEdit(app, event)
            
            %   return if nothing has been changed in table
            indices = event.Indices;
            previousData = event.PreviousData;
            newData = event.NewData;
            if newData == previousData
                return
            end

            %   extract info from table entry
            cellRow = indices(1);
            cellCol = indices(2);
            plotId = app.YAxisUITable.Data{cellRow,1};
            autoScale = app.YAxisUITable.Data{cellRow,4};

            %   if "Auto" is enabled:
            %   - set YMin/YMax table fields to NaN            
            %   - set axes y-axis scaling method to "auto"
            %
            %   if "Auto" is disabled:
            %   - set YMin/YMax table fields to current y-axis limits
            %   - set axes y-axis range
            %
            if cellCol == 4
                
                %   modify YMin/YMax table fields   
                if autoScale
                    app.YAxisUITable.Data{cellRow, 2} = NaN;
                    app.YAxisUITable.Data{cellRow, 3} = NaN;
                else
                    YLim = app.uiAxes(plotId).YLim;
                    app.YAxisUITable.Data{cellRow, 2} = YLim(1);
                    app.YAxisUITable.Data{cellRow, 3} = YLim(2);
                end
                
                %   set y-axis range
                app.Plots_SetYAxisRange(plotId);
                return

            end

            %   in case of "YMin" or "YMax" change:
            %   - undo change (set to NaN) if "Auto" is enabled
            %   - otherwise: set limit and redraw plot
            if cellCol < 4

                if autoScale
                    app.YAxisUITable.Data{cellRow, 2} = NaN;
                    app.YAxisUITable.Data{cellRow, 3} = NaN;
                else
                    app.Plots_SetYAxisRange(plotId);
                end

            end
            
        end

        % Value changed function: RefreshRatioEditField
        function RefreshRatioEditField_ValueChanged(app, event)
            
            %   check value
            if app.RefreshRatioEditField.Value > app.logBuffer.size
                app.RefreshRatioEditField.Value = app.logBuffer.size;
            elseif app.RefreshRatioEditField.Value <= 1
                app.RefreshRatioEditField.Value = 1;
            end

            %   note: the actual size of logTempBuffer is updated according
            %   to the value of the RefreshRatioEditField at every buffer
            %   refresh inside the UdpPort_CallbackFun 

        end

        % Value changed function: BufferSizeEditField
        function BufferSizeEditField_ValueChanged(app, event)

            
            %   if requested buffer size is less than plot refresh ratio:
            %   - set refresh ratio equal to requested buffer size
            requestedBufferSize = app.BufferSizeEditField.Value;
            if requestedBufferSize < app.RefreshRatioEditField.Value
                app.RefreshRatioEditField.Value = app.BufferSizeEditField.Value;
            end

            %   resize buffer
            if requestedBufferSize > app.logBuffer.tailPos

                %   buffer contains less data than the requested size:
                %   - remove extra space at the buffer end

                app.logBuffer.sampleIndex(requestedBufferSize+1:end) = [];
                app.logBuffer.time(requestedBufferSize+1:end) = [];
                app.logBuffer.signals(:,requestedBufferSize+1:end) = [];
                app.logBuffer.size = requestedBufferSize;

            else

                %   buffer contains more data than the requested size:
                %   - create a buffer of the requested size by retaining
                %   the latest ("more fresh") data

                tailPos = app.logBuffer.tailPos;
                range = tailPos-requestedBufferSize+1:tailPos;
                app.logBuffer.sampleIndex = app.logBuffer.sampleIndex(range);
                app.logBuffer.time = app.logBuffer.time(range);
                app.logBuffer.signals = app.logBuffer.signals(:,range);
                app.logBuffer.size = requestedBufferSize;
                app.logBuffer.tailPos = requestedBufferSize;

            end

            %   update number of points of animatedlines
            plotsNum = numel(app.uiAxes);
            for p = 1:plotsNum
                app.Plots_SetDuration(p);
            end

        end

        % Button pushed function: ClearBufferButton
        function ClearBuffer_ButtonPushed(app, event)
            
            %   reset buffers
            logBufferSize = app.logBuffer.size;
            app.logBuffer.sampleIndex = NaN*ones(1, logBufferSize);
            app.logBuffer.signals = cell(app.packetInfo.cellsNum, 1);
            app.logBuffer.tailPos = 1;

            logTempBufferSize = app.logTempBuffer.size;
            app.logTempBuffer.sampleIndex = NaN*ones(1, logTempBufferSize);
            app.logTempBuffer.signals = cell(app.packetInfo.cellsNum, 1);
            app.logTempBuffer.tailPos = 1;

            for n = 1:app.packetInfo.cellsNum
                app.logBuffer.signals{n} = NaN*ones(app.packetInfo.cellWidth(n), logBufferSize);
                app.logTempBuffer.signals{n} = NaN*ones(app.packetInfo.cellWidth(n), logTempBufferSize);
            end

            %   delete animatedlines points (but keep lines)
            plotsNum = numel(app.uiAxes);
            for p = 1:plotsNum
                if ishandle(app.uiAxes(p))
                    animatedLines = app.uiAxes(p).UserData.animatedLineObj;
                    animatedLines = reshape(animatedLines, 1, []);
                    if ~isempty(animatedLines)
                        for al = animatedLines
                            clearpoints(al);
                        end
                    end
                end
            end

        end

        % Value changed function: StartStopCmdCheckBox
        function StartStopCmdCheckBox_ValueChanged(app, event)
            
            if ~app.StartStopCmdCheckBox.Value
                app.StartStopCmdPanel.Visible = false;
            else
                app.StartStopCmdPanel.Visible = true;
            end
            
        end

        % Value changed function: LogToWorkspaceCheckBox
        function LogToWorkspaceCheckBox_ValueChanged(app, event)

            if ~app.LogToWorkspaceCheckBox.Value
                app.LogToWorkspacePanel.Visible = false;
            else
                app.LogToWorkspacePanel.Visible = true;
            end

        end

        % Menu selected function: Signals_ColorMenu
        function Signals_ColorMenuSelected(app, event)

            %   retrieve selected animatedline object
            al = app.Signals_ContextMenu.UserData;

            %   open modal color picker
            defaultColor = [0, 0, 1];
            color = uisetcolor(defaultColor);

            %   set animatedline color (if user selected a valid color)
            if numel(color) == 3
                set(al, 'Color', color)
            end

        end

        % Menu selected function: Signals_LineStyle_dashMenu, 
        % ...and 4 other components
        function Signals_LineStyleMenuSelected(app, event)
            
            %   retrieve selected animatedline object
            al = app.Signals_ContextMenu.UserData;

            %   get line style
            menuStr = event.Source.Text;
            switch menuStr
                case 'solid', lineStyle = '-';
                case 'dash', lineStyle = '--';
                case 'dot', lineStyle = ':';
                case 'dash-dot', lineStyle = '-.';
                case 'none', lineStyle = 'none';
                otherwise, lineStyle = '-';
            end

            %   set animatedline line style
            set(al, 'LineStyle', lineStyle);

        end

        % Menu selected function: Signals_LineWidth_Menu_0p5, 
        % ...and 6 other components
        function Signals_LineWidthMenuSelected(app, event)
            
            %   retrieve selected animatedline object
            al = app.Signals_ContextMenu.UserData;

            %   get line style
            menuStr = event.Source.Text;
            switch menuStr
                case '0.5', lineWidth = 0.5;
                case '1.0', lineWidth = 1.0;
                case '2.0', lineWidth = 2.0;
                case '3.0', lineWidth = 3.0;
                case '4.0', lineWidth = 4.0;
                case '5.0', lineWidth = 5.0;
                case '6.0', lineWidth = 6.0;
                otherwise, lineWidth = 0.5;
            end

            %   set animatedline line style
            set(al, 'LineWidth', lineWidth);

        end

        % Menu selected function: Signals_Marker_AsteriskMenu, 
        % ...and 13 other components
        function Signals_MarkerMenuSelected(app, event)
            
            %   retrieve selected animatedline object
            al = app.Signals_ContextMenu.UserData;

            %   get line style
            menuStr = event.Source.Text;

            %   set animatedline line style
            set(al, 'Marker', menuStr);

        end

        % Menu selected function: Signals_MarkerSize_Menu_10, 
        % ...and 11 other components
        function Signals_MarkerSizeMenuSelected(app, event)
            
            %   retrieve selected animatedline object
            al = app.Signals_ContextMenu.UserData;

            %   get line style
            menuStr = event.Source.Text;

            %   set animatedline line style
            set(al, 'MarkerSize', str2double(menuStr));

        end

        % Context menu opening function: Plots_ContextMenu
        function Plots_OpeningMenu(app, event)
            
            %   retrieve selected axes object
            ax = app.Plots_ContextMenu.UserData;
            if ~ishandle(ax)
                return
            end

            %   get legend visibility status
            legendObj = get(ax, 'Legend');
            if ishandle(legendObj)
                if legendObj.Visible == 'on'
                    isLegendVisible = true;
                else
                    isLegendVisible = false;
                end
            else
                isLegendVisible = false;
            end

            %   show/hide menu entries
            if isLegendVisible
                set(app.Plots_ShowLegendMenu, 'Visible', 'off');
                set(app.Plots_LegendLocationMenu, 'Visible', 'on');
                set(app.Plots_HideLegendMenu, 'Visible', 'on');
            else
                set(app.Plots_ShowLegendMenu, 'Visible', 'on');
                set(app.Plots_LegendLocationMenu, 'Visible', 'off');
                set(app.Plots_HideLegendMenu, 'Visible', 'off');
            end

        end

        % Menu selected function: Plots_ShowLegendMenu
        function Plots_ShowLegendMenuSelected(app, event)
            
            %   retrieve selected axes object
            ax = app.Plots_ContextMenu.UserData;

            %   turn legend off
            legend(ax, 'show');

        end

        % Menu selected function: Plots_HideLegendMenu
        function Plots_HideLegendMenuSelected(app, event)
            
            %   retrieve selected axes object
            ax = app.Plots_ContextMenu.UserData;

            %   turn legend on
            legend(ax, 'off');

        end

        % Menu selected function: Plots_Legend_LocationBestMenu, 
        % ...and 8 other components
        function Plots_LegendLocationMenuSelected(app, event)
            
            %   retrieve selected axes object
            ax = app.Plots_ContextMenu.UserData;
            if ~ishandle(ax)
                return
            end

            %   get legend location
            menuStr = event.Source.Text;

            %   set legend location
            legend(ax, 'Location', menuStr);

        end

        % Value changed function: VarNameEditField
        function VarName_ValueChanged(app, event)

            value = app.VarNameEditField.Value;
            if ~isvarname(value)
                errordlg( ...
                    'Invalid variable name.', ...
                    'Error', 'modal');
                app.VarNameEditField.Value = 'data';
            end

        end

        % Button pushed function: SaveToWorkspaceButton
        function SaveToWorkspace_ButtonPushed(app, event)
                
                %   extract log data
                data = app.logBuffer;
                data = rmfield(data, "tailPos");

                %  remove NaNs
                nanIdx = find(isnan(data.sampleIndex));
                data.sampleIndex(nanIdx) = [];
                data.time(nanIdx) = [];
                signalsNum = numel(data.signals);
                for s = 1:signalsNum
                    data.signals{s}(:,nanIdx) = [];
                end
                data.size = numel(data.sampleIndex);

                %   save log data to workspace
                varName = app.VarNameEditField.Value;
                assignin("base", varName, data);

        end

        % Close request function: UdpDataLoggerAppUIFigure
        function UdpDataLoggerAppUIFigure_CloseRequest(app, event)
            
            %   save log buffers to workspace
            if app.LogToWorkspaceCheckBox.Value && app.SaveToWorkspaceOnExitCheckBox.Value
            
                %   extract log data
                data = app.logBuffer;
                data = rmfield(data, "tailPos");

                %  remove NaNs
                nanIdx = find(isnan(data.sampleIndex));
                data.sampleIndex(nanIdx) = [];
                data.time(nanIdx) = [];
                signalsNum = numel(data.signals);
                for s = 1:signalsNum
                    data.signals{s}(:,nanIdx) = [];
                end
                data.size = numel(data.sampleIndex);

                %   save log data to workspace
                varName = app.VarNameEditField.Value;
                assignin("base", varName, data);

            end

            %   close app
            delete(app)
            
        end

        % Value changed function: TxSampleTimeEditField
        function TxSampleTimeEditFieldValueChanged(app, event)
            
            %   update number of points of animatedlines
            plotsNum = numel(app.uiAxes);
            for p = 1:plotsNum
                app.Plots_SetDuration(p);
            end

        end

        % Value changed function: RemoteIpAddressEditField
        function RemoteIpAddressEditFieldValueChanged(app, event)
            
            %   pattern for one IPv4 octet (0–255)
            octet = ...
                "25" + digitsPattern(1,1) | ...                      % 250–255
                "2"  + digitsPattern(1,1) + digitsPattern(1,1) | ... % 200–249
                "1"  + digitsPattern(1,2) | ...                      % 100–199
                digitsPattern(1,2) | ...                             % 0–99
                "0";                                                 % Allow single 0

            %   full IPv4 pattern
            ipv4Pattern = octet + "." + octet + "." + octet + "." + octet;

            %   validate ip addddress
            ipAddr = app.RemoteIpAddressEditField.Value;
            if ~matches(ipAddr, ipv4Pattern)
                errordlg(sprintf("'%s' is not a valid data IPv4 address.", ipAddr), ...
                    'Error', 'modal');
                app.RemoteIpAddressEditField.Value = app.defaultParams.remoteIpAddress;
            end

        end

        % Menu selected function: AboutMenu
        function AboutMenuSelected(app, event)
            msgText = { ...
                'Riccardo Antonello', ...
                '', ...
                'December 08, 2025', ...
                '', ...
                'Dept. of Information Engineering, University of Padova'};
            uialert(app.UdpDataLoggerAppUIFigure, ...
                msgText, ...
                "About", ...
                "Icon", "Info");
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UdpDataLoggerAppUIFigure and hide until all components are created
            app.UdpDataLoggerAppUIFigure = uifigure('Visible', 'off');
            app.UdpDataLoggerAppUIFigure.Position = [100 100 1010 601];
            app.UdpDataLoggerAppUIFigure.Name = 'UdpDataLoggerApp';
            app.UdpDataLoggerAppUIFigure.CloseRequestFcn = createCallbackFcn(app, @UdpDataLoggerAppUIFigure_CloseRequest, true);

            % Create UIFigureGridLayout
            app.UIFigureGridLayout = uigridlayout(app.UdpDataLoggerAppUIFigure);
            app.UIFigureGridLayout.ColumnWidth = {306, '39.24x'};
            app.UIFigureGridLayout.RowHeight = {46, '16.42x'};

            % Create PlotsPanel
            app.PlotsPanel = uipanel(app.UIFigureGridLayout);
            app.PlotsPanel.Layout.Row = [1 2];
            app.PlotsPanel.Layout.Column = 2;

            % Create PlotsPanelGridLayout
            app.PlotsPanelGridLayout = uigridlayout(app.PlotsPanel);
            app.PlotsPanelGridLayout.ColumnWidth = {'1x'};
            app.PlotsPanelGridLayout.RowHeight = {'1x'};

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigureGridLayout);
            app.TabGroup.Layout.Row = 2;
            app.TabGroup.Layout.Column = 1;

            % Create ConnectionTab
            app.ConnectionTab = uitab(app.TabGroup);
            app.ConnectionTab.Title = 'Connection';

            % Create ConnectionTabGridLayout
            app.ConnectionTabGridLayout = uigridlayout(app.ConnectionTab);
            app.ConnectionTabGridLayout.ColumnWidth = {'1x', '1x', '0.25x'};
            app.ConnectionTabGridLayout.RowHeight = {10, 22, 22, 22, 160};

            % Create StartStopCmdPanel
            app.StartStopCmdPanel = uipanel(app.ConnectionTabGridLayout);
            app.StartStopCmdPanel.Layout.Row = 5;
            app.StartStopCmdPanel.Layout.Column = [1 3];

            % Create StartStopGridLayout
            app.StartStopGridLayout = uigridlayout(app.StartStopCmdPanel);
            app.StartStopGridLayout.ColumnWidth = {'1x', '1x', '0.2x'};
            app.StartStopGridLayout.RowHeight = {22, 22, 10, 22, 22};

            % Create StartbyteEditFieldLabel
            app.StartbyteEditFieldLabel = uilabel(app.StartStopGridLayout);
            app.StartbyteEditFieldLabel.HorizontalAlignment = 'right';
            app.StartbyteEditFieldLabel.Layout.Row = 4;
            app.StartbyteEditFieldLabel.Layout.Column = 1;
            app.StartbyteEditFieldLabel.Text = 'Start byte';

            % Create StartByteEditField
            app.StartByteEditField = uieditfield(app.StartStopGridLayout, 'numeric');
            app.StartByteEditField.Limits = [0 255];
            app.StartByteEditField.RoundFractionalValues = 'on';
            app.StartByteEditField.ValueDisplayFormat = '%d';
            app.StartByteEditField.Layout.Row = 4;
            app.StartByteEditField.Layout.Column = 2;

            % Create StopbyteEditFieldLabel
            app.StopbyteEditFieldLabel = uilabel(app.StartStopGridLayout);
            app.StopbyteEditFieldLabel.HorizontalAlignment = 'right';
            app.StopbyteEditFieldLabel.Layout.Row = 5;
            app.StopbyteEditFieldLabel.Layout.Column = 1;
            app.StopbyteEditFieldLabel.Text = 'Stop byte';

            % Create StopByteEditField
            app.StopByteEditField = uieditfield(app.StartStopGridLayout, 'numeric');
            app.StopByteEditField.Limits = [0 255];
            app.StopByteEditField.RoundFractionalValues = 'on';
            app.StopByteEditField.ValueDisplayFormat = '%d';
            app.StopByteEditField.Layout.Row = 5;
            app.StopByteEditField.Layout.Column = 2;

            % Create RemoteUDPPortEditFieldLabel
            app.RemoteUDPPortEditFieldLabel = uilabel(app.StartStopGridLayout);
            app.RemoteUDPPortEditFieldLabel.HorizontalAlignment = 'right';
            app.RemoteUDPPortEditFieldLabel.Layout.Row = 1;
            app.RemoteUDPPortEditFieldLabel.Layout.Column = 1;
            app.RemoteUDPPortEditFieldLabel.Text = 'Remote UDP Port';

            % Create RemoteUdpPortEditField
            app.RemoteUdpPortEditField = uieditfield(app.StartStopGridLayout, 'numeric');
            app.RemoteUdpPortEditField.Layout.Row = 1;
            app.RemoteUdpPortEditField.Layout.Column = 2;

            % Create RemoteIPAddressEditFieldLabel_2
            app.RemoteIPAddressEditFieldLabel_2 = uilabel(app.StartStopGridLayout);
            app.RemoteIPAddressEditFieldLabel_2.HorizontalAlignment = 'right';
            app.RemoteIPAddressEditFieldLabel_2.Layout.Row = 2;
            app.RemoteIPAddressEditFieldLabel_2.Layout.Column = 1;
            app.RemoteIPAddressEditFieldLabel_2.Text = 'Remote IP Address';

            % Create RemoteIpAddressEditField
            app.RemoteIpAddressEditField = uieditfield(app.StartStopGridLayout, 'text');
            app.RemoteIpAddressEditField.ValueChangedFcn = createCallbackFcn(app, @RemoteIpAddressEditFieldValueChanged, true);
            app.RemoteIpAddressEditField.HorizontalAlignment = 'center';
            app.RemoteIpAddressEditField.Layout.Row = 2;
            app.RemoteIpAddressEditField.Layout.Column = 2;

            % Create StartStopCmdCheckBox
            app.StartStopCmdCheckBox = uicheckbox(app.ConnectionTabGridLayout);
            app.StartStopCmdCheckBox.ValueChangedFcn = createCallbackFcn(app, @StartStopCmdCheckBox_ValueChanged, true);
            app.StartStopCmdCheckBox.Text = 'Send Transmission Start/Stop Commands';
            app.StartStopCmdCheckBox.Layout.Row = 4;
            app.StartStopCmdCheckBox.Layout.Column = [1 3];

            % Create LocalUDPPortEditFieldLabel
            app.LocalUDPPortEditFieldLabel = uilabel(app.ConnectionTabGridLayout);
            app.LocalUDPPortEditFieldLabel.HorizontalAlignment = 'right';
            app.LocalUDPPortEditFieldLabel.Layout.Row = 2;
            app.LocalUDPPortEditFieldLabel.Layout.Column = 1;
            app.LocalUDPPortEditFieldLabel.Text = 'Local UDP Port';

            % Create LocalUDPPortEditField
            app.LocalUDPPortEditField = uieditfield(app.ConnectionTabGridLayout, 'numeric');
            app.LocalUDPPortEditField.Limits = [0 65535];
            app.LocalUDPPortEditField.RoundFractionalValues = 'on';
            app.LocalUDPPortEditField.Layout.Row = 2;
            app.LocalUDPPortEditField.Layout.Column = 2;

            % Create PacketTab
            app.PacketTab = uitab(app.TabGroup);
            app.PacketTab.Title = 'Packet';

            % Create PacketTabGridLayout
            app.PacketTabGridLayout = uigridlayout(app.PacketTab);
            app.PacketTabGridLayout.RowHeight = {22, '10x', 22};

            % Create NullTermCheckBox
            app.NullTermCheckBox = uicheckbox(app.PacketTabGridLayout);
            app.NullTermCheckBox.Text = 'Null terminated';
            app.NullTermCheckBox.Layout.Row = 3;
            app.NullTermCheckBox.Layout.Column = 2;
            app.NullTermCheckBox.Value = true;

            % Create COBSEncodedCheckBox
            app.COBSEncodedCheckBox = uicheckbox(app.PacketTabGridLayout);
            app.COBSEncodedCheckBox.Text = 'COBS Encoded';
            app.COBSEncodedCheckBox.Layout.Row = 3;
            app.COBSEncodedCheckBox.Layout.Column = 1;
            app.COBSEncodedCheckBox.Value = true;

            % Create PacketStructUITable
            app.PacketStructUITable = uitable(app.PacketTabGridLayout);
            app.PacketStructUITable.ColumnName = {'#'; 'Signal Type'; 'Dimension'};
            app.PacketStructUITable.ColumnWidth = {'1x', '6x', '3x'};
            app.PacketStructUITable.ColumnEditable = [false true true];
            app.PacketStructUITable.RowStriping = 'off';
            app.PacketStructUITable.CellEditCallback = createCallbackFcn(app, @PacketStructUITable_CellEdit, true);
            app.PacketStructUITable.Multiselect = 'off';
            app.PacketStructUITable.Layout.Row = 2;
            app.PacketStructUITable.Layout.Column = [1 2];

            % Create PacketStructLabel
            app.PacketStructLabel = uilabel(app.PacketTabGridLayout);
            app.PacketStructLabel.Layout.Row = 1;
            app.PacketStructLabel.Layout.Column = 1;
            app.PacketStructLabel.Text = 'Packet structure:';

            % Create LogTab
            app.LogTab = uitab(app.TabGroup);
            app.LogTab.Title = 'Log';

            % Create LogTabGridLayout
            app.LogTabGridLayout = uigridlayout(app.LogTab);
            app.LogTabGridLayout.ColumnWidth = {'2x', '2x'};
            app.LogTabGridLayout.RowHeight = {22, 22, 22, 22, 22, 22, 22, 22, 22, '1x'};

            % Create ClearBufferButton
            app.ClearBufferButton = uibutton(app.LogTabGridLayout, 'push');
            app.ClearBufferButton.ButtonPushedFcn = createCallbackFcn(app, @ClearBuffer_ButtonPushed, true);
            app.ClearBufferButton.Layout.Row = 3;
            app.ClearBufferButton.Layout.Column = 2;
            app.ClearBufferButton.Text = 'Clear buffer';

            % Create BuffersizeEditFieldLabel
            app.BuffersizeEditFieldLabel = uilabel(app.LogTabGridLayout);
            app.BuffersizeEditFieldLabel.HorizontalAlignment = 'right';
            app.BuffersizeEditFieldLabel.Layout.Row = 1;
            app.BuffersizeEditFieldLabel.Layout.Column = 1;
            app.BuffersizeEditFieldLabel.Text = 'Buffer size';

            % Create BufferSizeEditField
            app.BufferSizeEditField = uieditfield(app.LogTabGridLayout, 'numeric');
            app.BufferSizeEditField.Limits = [1 100000];
            app.BufferSizeEditField.RoundFractionalValues = 'on';
            app.BufferSizeEditField.ValueDisplayFormat = '%d';
            app.BufferSizeEditField.ValueChangedFcn = createCallbackFcn(app, @BufferSizeEditField_ValueChanged, true);
            app.BufferSizeEditField.Layout.Row = 1;
            app.BufferSizeEditField.Layout.Column = 2;
            app.BufferSizeEditField.Value = 1000;

            % Create TxSampleTimesEditFieldLabel
            app.TxSampleTimesEditFieldLabel = uilabel(app.LogTabGridLayout);
            app.TxSampleTimesEditFieldLabel.HorizontalAlignment = 'right';
            app.TxSampleTimesEditFieldLabel.Layout.Row = 2;
            app.TxSampleTimesEditFieldLabel.Layout.Column = 1;
            app.TxSampleTimesEditFieldLabel.Text = 'Tx Sample Time [s]';

            % Create TxSampleTimeEditField
            app.TxSampleTimeEditField = uieditfield(app.LogTabGridLayout, 'numeric');
            app.TxSampleTimeEditField.Limits = [2.22044604925031e-16 Inf];
            app.TxSampleTimeEditField.ValueChangedFcn = createCallbackFcn(app, @TxSampleTimeEditFieldValueChanged, true);
            app.TxSampleTimeEditField.Layout.Row = 2;
            app.TxSampleTimeEditField.Layout.Column = 2;
            app.TxSampleTimeEditField.Value = 1;

            % Create LogToWorkspacePanel
            app.LogToWorkspacePanel = uipanel(app.LogTabGridLayout);
            app.LogToWorkspacePanel.Layout.Row = [6 9];
            app.LogToWorkspacePanel.Layout.Column = [1 2];

            % Create LogToWorkspaceGridLayout
            app.LogToWorkspaceGridLayout = uigridlayout(app.LogToWorkspacePanel);
            app.LogToWorkspaceGridLayout.RowHeight = {22, 22, 22};

            % Create VariablenameEditFieldLabel
            app.VariablenameEditFieldLabel = uilabel(app.LogToWorkspaceGridLayout);
            app.VariablenameEditFieldLabel.HorizontalAlignment = 'right';
            app.VariablenameEditFieldLabel.Layout.Row = 1;
            app.VariablenameEditFieldLabel.Layout.Column = 1;
            app.VariablenameEditFieldLabel.Text = 'Variable name';

            % Create VarNameEditField
            app.VarNameEditField = uieditfield(app.LogToWorkspaceGridLayout, 'text');
            app.VarNameEditField.ValueChangedFcn = createCallbackFcn(app, @VarName_ValueChanged, true);
            app.VarNameEditField.Layout.Row = 1;
            app.VarNameEditField.Layout.Column = 2;
            app.VarNameEditField.Value = 'data';

            % Create SaveToWorkspaceButton
            app.SaveToWorkspaceButton = uibutton(app.LogToWorkspaceGridLayout, 'push');
            app.SaveToWorkspaceButton.ButtonPushedFcn = createCallbackFcn(app, @SaveToWorkspace_ButtonPushed, true);
            app.SaveToWorkspaceButton.Layout.Row = 2;
            app.SaveToWorkspaceButton.Layout.Column = 2;
            app.SaveToWorkspaceButton.Text = 'Save to workspace';

            % Create SaveToWorkspaceOnExitCheckBox
            app.SaveToWorkspaceOnExitCheckBox = uicheckbox(app.LogToWorkspaceGridLayout);
            app.SaveToWorkspaceOnExitCheckBox.Text = 'Save to workspace on exit';
            app.SaveToWorkspaceOnExitCheckBox.Layout.Row = 3;
            app.SaveToWorkspaceOnExitCheckBox.Layout.Column = [1 2];
            app.SaveToWorkspaceOnExitCheckBox.Value = true;

            % Create LogToWorkspaceCheckBox
            app.LogToWorkspaceCheckBox = uicheckbox(app.LogTabGridLayout);
            app.LogToWorkspaceCheckBox.ValueChangedFcn = createCallbackFcn(app, @LogToWorkspaceCheckBox_ValueChanged, true);
            app.LogToWorkspaceCheckBox.Text = 'Log to Workspace';
            app.LogToWorkspaceCheckBox.Layout.Row = 5;
            app.LogToWorkspaceCheckBox.Layout.Column = [1 2];
            app.LogToWorkspaceCheckBox.Value = true;

            % Create PlotsTab
            app.PlotsTab = uitab(app.TabGroup);
            app.PlotsTab.Title = 'Plots';

            % Create PlotsTabGridLayout
            app.PlotsTabGridLayout = uigridlayout(app.PlotsTab);
            app.PlotsTabGridLayout.ColumnWidth = {'2x', '1x', '1x'};
            app.PlotsTabGridLayout.RowHeight = {22, '6x', '6x', 22};

            % Create PlotGridLabel
            app.PlotGridLabel = uilabel(app.PlotsTabGridLayout);
            app.PlotGridLabel.Layout.Row = 1;
            app.PlotGridLabel.Layout.Column = [1 2];
            app.PlotGridLabel.Text = '';

            % Create RefreshRatioEditField
            app.RefreshRatioEditField = uieditfield(app.PlotsTabGridLayout, 'numeric');
            app.RefreshRatioEditField.Limits = [1 Inf];
            app.RefreshRatioEditField.RoundFractionalValues = 'on';
            app.RefreshRatioEditField.ValueChangedFcn = createCallbackFcn(app, @RefreshRatioEditField_ValueChanged, true);
            app.RefreshRatioEditField.Layout.Row = 4;
            app.RefreshRatioEditField.Layout.Column = 3;
            app.RefreshRatioEditField.Value = 4;

            % Create XYAxesTabGroup
            app.XYAxesTabGroup = uitabgroup(app.PlotsTabGridLayout);
            app.XYAxesTabGroup.Layout.Row = 3;
            app.XYAxesTabGroup.Layout.Column = [1 3];

            % Create XAxisTab
            app.XAxisTab = uitab(app.XYAxesTabGroup);
            app.XAxisTab.Title = 'X Axis';

            % Create XAxisTabGridLayout
            app.XAxisTabGridLayout = uigridlayout(app.XAxisTab);
            app.XAxisTabGridLayout.ColumnWidth = {'1x'};
            app.XAxisTabGridLayout.RowHeight = {'1x'};

            % Create XAxisUITable
            app.XAxisUITable = uitable(app.XAxisTabGridLayout);
            app.XAxisUITable.ColumnName = {'Plot #'; 'Unit'; 'Duration'};
            app.XAxisUITable.ColumnWidth = {'1x', '2x', '2x'};
            app.XAxisUITable.RowName = {};
            app.XAxisUITable.ColumnEditable = [false true true];
            app.XAxisUITable.RowStriping = 'off';
            app.XAxisUITable.CellEditCallback = createCallbackFcn(app, @XAxisUITable_CellEdit, true);
            app.XAxisUITable.Layout.Row = 1;
            app.XAxisUITable.Layout.Column = 1;

            % Create YAxisTab
            app.YAxisTab = uitab(app.XYAxesTabGroup);
            app.YAxisTab.Title = 'Y Axis';

            % Create YAxisTabGridLayout
            app.YAxisTabGridLayout = uigridlayout(app.YAxisTab);
            app.YAxisTabGridLayout.ColumnWidth = {'1x'};
            app.YAxisTabGridLayout.RowHeight = {'1x'};

            % Create YAxisUITable
            app.YAxisUITable = uitable(app.YAxisTabGridLayout);
            app.YAxisUITable.ColumnName = {'Plot #'; 'YMin'; 'YMax'; 'Auto'};
            app.YAxisUITable.ColumnWidth = {'1x', '1x', '1x', '1x'};
            app.YAxisUITable.RowName = {};
            app.YAxisUITable.ColumnEditable = [false true true true];
            app.YAxisUITable.RowStriping = 'off';
            app.YAxisUITable.CellEditCallback = createCallbackFcn(app, @YAxisUITable_CellEdit, true);
            app.YAxisUITable.Layout.Row = 1;
            app.YAxisUITable.Layout.Column = 1;

            % Create PlotgridrowscolsEditFieldLabel
            app.PlotgridrowscolsEditFieldLabel = uilabel(app.PlotsTabGridLayout);
            app.PlotgridrowscolsEditFieldLabel.HorizontalAlignment = 'right';
            app.PlotgridrowscolsEditFieldLabel.Layout.Row = 1;
            app.PlotgridrowscolsEditFieldLabel.Layout.Column = 1;
            app.PlotgridrowscolsEditFieldLabel.Text = 'Plot grid (# rows/cols)';

            % Create PlotsUITree
            app.PlotsUITree = uitree(app.PlotsTabGridLayout, 'checkbox');
            app.PlotsUITree.Layout.Row = 2;
            app.PlotsUITree.Layout.Column = [1 3];

            % Assign Checked Nodes
            app.PlotsUITree.CheckedNodesChangedFcn = createCallbackFcn(app, @PlotsUITree_CheckedNodesChanged, true);

            % Create RefreshRatioLabel
            app.RefreshRatioLabel = uilabel(app.PlotsTabGridLayout);
            app.RefreshRatioLabel.HorizontalAlignment = 'right';
            app.RefreshRatioLabel.Layout.Row = 4;
            app.RefreshRatioLabel.Layout.Column = [1 2];
            app.RefreshRatioLabel.Text = 'Refresh every # packets received';

            % Create PlotGridColsEditField
            app.PlotGridColsEditField = uieditfield(app.PlotsTabGridLayout, 'numeric');
            app.PlotGridColsEditField.Limits = [1 10];
            app.PlotGridColsEditField.RoundFractionalValues = 'on';
            app.PlotGridColsEditField.ValueChangedFcn = createCallbackFcn(app, @PlotsGridColsEditField_ValueChanged, true);
            app.PlotGridColsEditField.Layout.Row = 1;
            app.PlotGridColsEditField.Layout.Column = 3;
            app.PlotGridColsEditField.Value = 1;

            % Create PlotGridRowsEditField
            app.PlotGridRowsEditField = uieditfield(app.PlotsTabGridLayout, 'numeric');
            app.PlotGridRowsEditField.Limits = [1 10];
            app.PlotGridRowsEditField.RoundFractionalValues = 'on';
            app.PlotGridRowsEditField.ValueChangedFcn = createCallbackFcn(app, @PlotsGridRowsEditField_ValueChanged, true);
            app.PlotGridRowsEditField.Layout.Row = 1;
            app.PlotGridRowsEditField.Layout.Column = 2;
            app.PlotGridRowsEditField.Value = 1;

            % Create StatusPanel
            app.StatusPanel = uipanel(app.UIFigureGridLayout);
            app.StatusPanel.Layout.Row = 1;
            app.StatusPanel.Layout.Column = 1;

            % Create StatusPanelGridLayout
            app.StatusPanelGridLayout = uigridlayout(app.StatusPanel);
            app.StatusPanelGridLayout.ColumnWidth = {123, 64, 20};
            app.StatusPanelGridLayout.RowHeight = {22};

            % Create ConnectSwitch
            app.ConnectSwitch = uiswitch(app.StatusPanelGridLayout, 'slider');
            app.ConnectSwitch.ValueChangedFcn = createCallbackFcn(app, @ConnectSwitch_ValueChanged, true);
            app.ConnectSwitch.Layout.Row = 1;
            app.ConnectSwitch.Layout.Column = 1;

            % Create ConnectedLampLabel
            app.ConnectedLampLabel = uilabel(app.StatusPanelGridLayout);
            app.ConnectedLampLabel.HorizontalAlignment = 'right';
            app.ConnectedLampLabel.Layout.Row = 1;
            app.ConnectedLampLabel.Layout.Column = 2;
            app.ConnectedLampLabel.Text = 'Connected';

            % Create ConnectedLamp
            app.ConnectedLamp = uilamp(app.StatusPanelGridLayout);
            app.ConnectedLamp.Layout.Row = 1;
            app.ConnectedLamp.Layout.Column = 3;
            app.ConnectedLamp.Color = [0.651 0.651 0.651];

            % Create PacketStructUITable_ContextMenu
            app.PacketStructUITable_ContextMenu = uicontextmenu(app.UdpDataLoggerAppUIFigure);

            % Create PacketStructUITable_AddRowMenu
            app.PacketStructUITable_AddRowMenu = uimenu(app.PacketStructUITable_ContextMenu);
            app.PacketStructUITable_AddRowMenu.MenuSelectedFcn = createCallbackFcn(app, @PacketStructUITable_AddRowMenuSelected, true);
            app.PacketStructUITable_AddRowMenu.Text = 'Add row';

            % Create PacketStructUITable_DeleteRowMenu
            app.PacketStructUITable_DeleteRowMenu = uimenu(app.PacketStructUITable_ContextMenu);
            app.PacketStructUITable_DeleteRowMenu.MenuSelectedFcn = createCallbackFcn(app, @PacketStructUITable_DeleteRowMenuSelected, true);
            app.PacketStructUITable_DeleteRowMenu.Text = 'Delete row';

            % Create PacketStructUITable_MoveUpMenu
            app.PacketStructUITable_MoveUpMenu = uimenu(app.PacketStructUITable_ContextMenu);
            app.PacketStructUITable_MoveUpMenu.MenuSelectedFcn = createCallbackFcn(app, @PacketStructUITable_MoveUpMenuSelected, true);
            app.PacketStructUITable_MoveUpMenu.Text = 'Move up';

            % Create PacketStructUITable_MoveDownMenu
            app.PacketStructUITable_MoveDownMenu = uimenu(app.PacketStructUITable_ContextMenu);
            app.PacketStructUITable_MoveDownMenu.MenuSelectedFcn = createCallbackFcn(app, @PacketStructUITable_MoveDownMenuSelected, true);
            app.PacketStructUITable_MoveDownMenu.Text = 'Move down';
            
            % Assign app.PacketStructUITable_ContextMenu
            app.PacketStructUITable.ContextMenu = app.PacketStructUITable_ContextMenu;

            % Create Signals_ContextMenu
            app.Signals_ContextMenu = uicontextmenu(app.UdpDataLoggerAppUIFigure);

            % Create Signals_ColorMenu
            app.Signals_ColorMenu = uimenu(app.Signals_ContextMenu);
            app.Signals_ColorMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_ColorMenuSelected, true);
            app.Signals_ColorMenu.Text = 'Color ...';

            % Create Signals_LineStyleMenu
            app.Signals_LineStyleMenu = uimenu(app.Signals_ContextMenu);
            app.Signals_LineStyleMenu.Text = 'Line Style';

            % Create Signals_LineStyle_solidMenu
            app.Signals_LineStyle_solidMenu = uimenu(app.Signals_LineStyleMenu);
            app.Signals_LineStyle_solidMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineStyleMenuSelected, true);
            app.Signals_LineStyle_solidMenu.Text = 'solid';

            % Create Signals_LineStyle_dashMenu
            app.Signals_LineStyle_dashMenu = uimenu(app.Signals_LineStyleMenu);
            app.Signals_LineStyle_dashMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineStyleMenuSelected, true);
            app.Signals_LineStyle_dashMenu.Text = 'dash';

            % Create Signals_LineStyle_dotMenu
            app.Signals_LineStyle_dotMenu = uimenu(app.Signals_LineStyleMenu);
            app.Signals_LineStyle_dotMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineStyleMenuSelected, true);
            app.Signals_LineStyle_dotMenu.Text = 'dot';

            % Create Signals_LineStyle_dashdotMenu
            app.Signals_LineStyle_dashdotMenu = uimenu(app.Signals_LineStyleMenu);
            app.Signals_LineStyle_dashdotMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineStyleMenuSelected, true);
            app.Signals_LineStyle_dashdotMenu.Text = 'dash-dot';

            % Create Signals_LineStyle_noneMenu
            app.Signals_LineStyle_noneMenu = uimenu(app.Signals_LineStyleMenu);
            app.Signals_LineStyle_noneMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineStyleMenuSelected, true);
            app.Signals_LineStyle_noneMenu.Text = 'none';

            % Create Signals_LineWidthMenu
            app.Signals_LineWidthMenu = uimenu(app.Signals_ContextMenu);
            app.Signals_LineWidthMenu.Text = 'Line Width';

            % Create Signals_LineWidth_Menu_0p5
            app.Signals_LineWidth_Menu_0p5 = uimenu(app.Signals_LineWidthMenu);
            app.Signals_LineWidth_Menu_0p5.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineWidthMenuSelected, true);
            app.Signals_LineWidth_Menu_0p5.Text = '0.5';

            % Create Signals_LineWidth_Menu_1
            app.Signals_LineWidth_Menu_1 = uimenu(app.Signals_LineWidthMenu);
            app.Signals_LineWidth_Menu_1.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineWidthMenuSelected, true);
            app.Signals_LineWidth_Menu_1.Text = '1.0';

            % Create Signals_LineWidth_Menu_2
            app.Signals_LineWidth_Menu_2 = uimenu(app.Signals_LineWidthMenu);
            app.Signals_LineWidth_Menu_2.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineWidthMenuSelected, true);
            app.Signals_LineWidth_Menu_2.Text = '2.0';

            % Create Signals_LineWidth_Menu_3
            app.Signals_LineWidth_Menu_3 = uimenu(app.Signals_LineWidthMenu);
            app.Signals_LineWidth_Menu_3.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineWidthMenuSelected, true);
            app.Signals_LineWidth_Menu_3.Text = '3.0';

            % Create Signals_LineWidth_Menu_4
            app.Signals_LineWidth_Menu_4 = uimenu(app.Signals_LineWidthMenu);
            app.Signals_LineWidth_Menu_4.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineWidthMenuSelected, true);
            app.Signals_LineWidth_Menu_4.Text = '4.0';

            % Create Signals_LineWidth_Menu_5
            app.Signals_LineWidth_Menu_5 = uimenu(app.Signals_LineWidthMenu);
            app.Signals_LineWidth_Menu_5.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineWidthMenuSelected, true);
            app.Signals_LineWidth_Menu_5.Text = '5.0';

            % Create Signals_LineWidth_Menu_6
            app.Signals_LineWidth_Menu_6 = uimenu(app.Signals_LineWidthMenu);
            app.Signals_LineWidth_Menu_6.MenuSelectedFcn = createCallbackFcn(app, @Signals_LineWidthMenuSelected, true);
            app.Signals_LineWidth_Menu_6.Text = '6.0';

            % Create Signals_MarkerMenu
            app.Signals_MarkerMenu = uimenu(app.Signals_ContextMenu);
            app.Signals_MarkerMenu.Text = 'Marker';

            % Create Signals_Marker_CircleMenu
            app.Signals_Marker_CircleMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_CircleMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_CircleMenu.Text = 'o';

            % Create Signals_Marker_PlusSignMenu
            app.Signals_Marker_PlusSignMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_PlusSignMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_PlusSignMenu.Text = '+';

            % Create Signals_Marker_AsteriskMenu
            app.Signals_Marker_AsteriskMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_AsteriskMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_AsteriskMenu.Text = '*';

            % Create Signals_Marker_PointMenu
            app.Signals_Marker_PointMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_PointMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_PointMenu.Text = '.';

            % Create Signals_Marker_CrossMenu
            app.Signals_Marker_CrossMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_CrossMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_CrossMenu.Text = 'x';

            % Create Signals_Marker_SquareMenu
            app.Signals_Marker_SquareMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_SquareMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_SquareMenu.Text = 'square';

            % Create Signals_Marker_DiamondMenu
            app.Signals_Marker_DiamondMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_DiamondMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_DiamondMenu.Text = 'diamond';

            % Create Signals_Marker_UpTriangleMenu
            app.Signals_Marker_UpTriangleMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_UpTriangleMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_UpTriangleMenu.Text = '^';

            % Create Signals_Marker_DownTriangleMenu
            app.Signals_Marker_DownTriangleMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_DownTriangleMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_DownTriangleMenu.Text = 'v';

            % Create Signals_Marker_RightTriangleMenu
            app.Signals_Marker_RightTriangleMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_RightTriangleMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_RightTriangleMenu.Text = '>';

            % Create Signals_Marker_LeftTriangleMenu
            app.Signals_Marker_LeftTriangleMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_LeftTriangleMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_LeftTriangleMenu.Text = '<';

            % Create Signals_Marker_PentagramMenu
            app.Signals_Marker_PentagramMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_PentagramMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_PentagramMenu.Text = 'pentagram';

            % Create Signals_Marker_HexagramMenu
            app.Signals_Marker_HexagramMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_HexagramMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_HexagramMenu.Text = 'hexagram';

            % Create Signals_Marker_NoneMenu
            app.Signals_Marker_NoneMenu = uimenu(app.Signals_MarkerMenu);
            app.Signals_Marker_NoneMenu.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerMenuSelected, true);
            app.Signals_Marker_NoneMenu.Text = 'none';

            % Create Signals_MarkerSizeMenu
            app.Signals_MarkerSizeMenu = uimenu(app.Signals_ContextMenu);
            app.Signals_MarkerSizeMenu.Text = 'Marker Size';

            % Create Signals_MarkerSize_Menu_2
            app.Signals_MarkerSize_Menu_2 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_2.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_2.Text = '2';

            % Create Signals_MarkerSize_Menu_4
            app.Signals_MarkerSize_Menu_4 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_4.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_4.Text = '4';

            % Create Signals_MarkerSize_Menu_6
            app.Signals_MarkerSize_Menu_6 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_6.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_6.Text = '6';

            % Create Signals_MarkerSize_Menu_8
            app.Signals_MarkerSize_Menu_8 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_8.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_8.Text = '8';

            % Create Signals_MarkerSize_Menu_10
            app.Signals_MarkerSize_Menu_10 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_10.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_10.Text = '10';

            % Create Signals_MarkerSize_Menu_12
            app.Signals_MarkerSize_Menu_12 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_12.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_12.Text = '12';

            % Create Signals_MarkerSize_Menu_14
            app.Signals_MarkerSize_Menu_14 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_14.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_14.Text = '14';

            % Create Signals_MarkerSize_Menu_16
            app.Signals_MarkerSize_Menu_16 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_16.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_16.Text = '16';

            % Create Signals_MarkerSize_Menu_18
            app.Signals_MarkerSize_Menu_18 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_18.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_18.Text = '18';

            % Create Signals_MarkerSize_Menu_20
            app.Signals_MarkerSize_Menu_20 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_20.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_20.Text = '20';

            % Create Signals_MarkerSize_Menu_22
            app.Signals_MarkerSize_Menu_22 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_22.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_22.Text = '22';

            % Create Signals_MarkerSize_Menu_24
            app.Signals_MarkerSize_Menu_24 = uimenu(app.Signals_MarkerSizeMenu);
            app.Signals_MarkerSize_Menu_24.MenuSelectedFcn = createCallbackFcn(app, @Signals_MarkerSizeMenuSelected, true);
            app.Signals_MarkerSize_Menu_24.Text = '24';

            % Create Plots_ContextMenu
            app.Plots_ContextMenu = uicontextmenu(app.UdpDataLoggerAppUIFigure);
            app.Plots_ContextMenu.ContextMenuOpeningFcn = createCallbackFcn(app, @Plots_OpeningMenu, true);

            % Create Plots_ShowLegendMenu
            app.Plots_ShowLegendMenu = uimenu(app.Plots_ContextMenu);
            app.Plots_ShowLegendMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_ShowLegendMenuSelected, true);
            app.Plots_ShowLegendMenu.Text = 'Show Legend';

            % Create Plots_LegendLocationMenu
            app.Plots_LegendLocationMenu = uimenu(app.Plots_ContextMenu);
            app.Plots_LegendLocationMenu.Text = 'Legend Location';

            % Create Plots_Legend_LocationNorthMenu
            app.Plots_Legend_LocationNorthMenu = uimenu(app.Plots_LegendLocationMenu);
            app.Plots_Legend_LocationNorthMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_LegendLocationMenuSelected, true);
            app.Plots_Legend_LocationNorthMenu.Text = 'north';

            % Create Plots_Legend_LocationSouthMenu
            app.Plots_Legend_LocationSouthMenu = uimenu(app.Plots_LegendLocationMenu);
            app.Plots_Legend_LocationSouthMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_LegendLocationMenuSelected, true);
            app.Plots_Legend_LocationSouthMenu.Text = 'south';

            % Create Plots_Legend_LocationEastMenu
            app.Plots_Legend_LocationEastMenu = uimenu(app.Plots_LegendLocationMenu);
            app.Plots_Legend_LocationEastMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_LegendLocationMenuSelected, true);
            app.Plots_Legend_LocationEastMenu.Text = 'east';

            % Create Plots_Legend_LocationWestMenu
            app.Plots_Legend_LocationWestMenu = uimenu(app.Plots_LegendLocationMenu);
            app.Plots_Legend_LocationWestMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_LegendLocationMenuSelected, true);
            app.Plots_Legend_LocationWestMenu.Text = 'west';

            % Create Plots_Legend_LocationNorthEastMenu
            app.Plots_Legend_LocationNorthEastMenu = uimenu(app.Plots_LegendLocationMenu);
            app.Plots_Legend_LocationNorthEastMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_LegendLocationMenuSelected, true);
            app.Plots_Legend_LocationNorthEastMenu.Text = 'northeast';

            % Create Plots_Legend_LocationNorthWestMenu
            app.Plots_Legend_LocationNorthWestMenu = uimenu(app.Plots_LegendLocationMenu);
            app.Plots_Legend_LocationNorthWestMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_LegendLocationMenuSelected, true);
            app.Plots_Legend_LocationNorthWestMenu.Text = 'northwest';

            % Create Plots_Legend_LocationSouthEastMenu
            app.Plots_Legend_LocationSouthEastMenu = uimenu(app.Plots_LegendLocationMenu);
            app.Plots_Legend_LocationSouthEastMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_LegendLocationMenuSelected, true);
            app.Plots_Legend_LocationSouthEastMenu.Text = 'southeast';

            % Create Plots_Legend_LocationSouthWestMenu
            app.Plots_Legend_LocationSouthWestMenu = uimenu(app.Plots_LegendLocationMenu);
            app.Plots_Legend_LocationSouthWestMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_LegendLocationMenuSelected, true);
            app.Plots_Legend_LocationSouthWestMenu.Text = 'southwest';

            % Create Plots_Legend_LocationBestMenu
            app.Plots_Legend_LocationBestMenu = uimenu(app.Plots_LegendLocationMenu);
            app.Plots_Legend_LocationBestMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_LegendLocationMenuSelected, true);
            app.Plots_Legend_LocationBestMenu.Text = 'best';

            % Create Plots_HideLegendMenu
            app.Plots_HideLegendMenu = uimenu(app.Plots_ContextMenu);
            app.Plots_HideLegendMenu.MenuSelectedFcn = createCallbackFcn(app, @Plots_HideLegendMenuSelected, true);
            app.Plots_HideLegendMenu.Text = 'Hide Legend';

            % Create ContextMenu
            app.ContextMenu = uicontextmenu(app.UdpDataLoggerAppUIFigure);

            % Create AboutMenu
            app.AboutMenu = uimenu(app.ContextMenu);
            app.AboutMenu.MenuSelectedFcn = createCallbackFcn(app, @AboutMenuSelected, true);
            app.AboutMenu.Text = 'About ...';
            
            % Assign app.ContextMenu
            app.ConnectionTabGridLayout.ContextMenu = app.ContextMenu;
            app.PacketTabGridLayout.ContextMenu = app.ContextMenu;
            app.LogTabGridLayout.ContextMenu = app.ContextMenu;
            app.PlotGridRowsEditField.ContextMenu = app.ContextMenu;
            app.StatusPanelGridLayout.ContextMenu = app.ContextMenu;

            % Show the figure after all components are created
            app.UdpDataLoggerAppUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = udpDataLoggerApp(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UdpDataLoggerAppUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UdpDataLoggerAppUIFigure)
        end
    end
end