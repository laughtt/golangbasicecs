// Copyright (c) .NET Foundation and contributors. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace Dotnet.Docker
{
    public class ErrorTraceListener : TraceListener
    {
        private List<string> errors = new List<string>();

        public IEnumerable<string> Errors => errors;

        public override void TraceEvent(TraceEventCache eventCache, string source, TraceEventType eventType, int id, string message)
        {
            if (eventType == TraceEventType.Error)
            {
                this.errors.Add(message);
            }
            
            base.TraceEvent(eventCache, source, eventType, id, message);
        }

        public override void Write(string message)
        {
        }

        public override void WriteLine(string message)
        {
        }
    }
}
